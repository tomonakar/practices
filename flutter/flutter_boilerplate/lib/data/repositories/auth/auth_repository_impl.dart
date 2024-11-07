// lib/data/repositories/auth/auth_repository_impl.dart
import 'package:flutter_boilerplate/data/datasources/data_source_exception.dart';
import 'package:flutter_boilerplate/data/datasources/local/interfaces/auth_local_data_source.dart';
import 'package:flutter_boilerplate/data/datasources/remote/interfaces/auth_remote_data_source.dart';
import 'package:flutter_boilerplate/domain/entities/auth/auth_token.dart';
import 'package:flutter_boilerplate/domain/common/result.dart';
import 'package:flutter_boilerplate/domain/entities/user/user.dart';
import 'package:flutter_boilerplate/domain/repositories/auth/auth_repository.dart';
import 'package:flutter_boilerplate/domain/values/app_error.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _remoteDataSource;
  final AuthLocalDataSource _localDataSource;

  AuthRepositoryImpl(this._remoteDataSource, this._localDataSource);

  @override
  Future<Result<User>> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final token = await _remoteDataSource.signIn(
        email: email,
        password: password,
      );
      await _localDataSource.saveAuthToken(token);

      final user = await _remoteDataSource.getCurrentUser(
        accessToken: token.accessToken,
      );
      await _localDataSource.saveCurrentUser(user);

      return Result.success(user.toDomain());
    } on DataSourceException catch (e) {
      return Result.failure(_mapDataSourceError(e));
    }
  }

  @override
  Future<Result<void>> signOut() async {
    try {
      final token = await _localDataSource.getAuthToken();
      if (token != null) {
        await _remoteDataSource.signOut(accessToken: token.accessToken);
      }
      await _localDataSource.deleteAuthToken();
      await _localDataSource.deleteCurrentUser();
      return const Result.success(null);
    } on DataSourceException catch (e) {
      return Result.failure(_mapDataSourceError(e));
    }
  }

  @override
  Future<Result<User?>> getCurrentUser() async {
    try {
      // まずローカルをチェック
      final cachedUser = await _localDataSource.getCurrentUser();
      if (cachedUser != null) {
        return Result.success(cachedUser.toDomain());
      }

      // トークンがある場合はリモートから取得
      final token = await _localDataSource.getAuthToken();
      if (token != null) {
        final user = await _remoteDataSource.getCurrentUser(
          accessToken: token.accessToken,
        );
        await _localDataSource.saveCurrentUser(user);
        return Result.success(user.toDomain());
      }

      return const Result.success(null);
    } on DataSourceException catch (e) {
      return Result.failure(_mapDataSourceError(e));
    }
  }

  @override
  Future<Result<AuthToken>> refreshToken(String refreshToken) async {
    try {
      final newToken = await _remoteDataSource.refreshToken(
        refreshToken: refreshToken,
      );
      await _localDataSource.saveAuthToken(newToken);
      return Result.success(newToken.toDomain());
    } on DataSourceException catch (e) {
      return Result.failure(_mapDataSourceError(e));
    }
  }

  @override
  Future<Result<void>> sendPasswordResetEmail(String email) async {
    try {
      await _remoteDataSource.sendPasswordResetEmail(email: email);
      return const Result.success(null);
    } on DataSourceException catch (e) {
      return Result.failure(_mapDataSourceError(e));
    }
  }

  @override
  Future<Result<void>> updatePassword({
    required String oldPassword,
    required String newPassword,
  }) async {
    try {
      final token = await _localDataSource.getAuthToken();
      if (token == null) {
        return const Result.failure(AppError.unauthorized());
      }

      await _remoteDataSource.updatePassword(
        accessToken: token.accessToken,
        oldPassword: oldPassword,
        newPassword: newPassword,
      );
      return const Result.success(null);
    } on DataSourceException catch (e) {
      return Result.failure(_mapDataSourceError(e));
    }
  }

  // DataSourceExceptionをAppErrorに変換するヘルパーメソッド
  AppError _mapDataSourceError(DataSourceException exception) {
    return exception.when(
      network: (message) => AppError.network(message),
      notFound: (message) => AppError.api(404, message),
      unauthorized: (message) => AppError.unauthorized(message),
      badRequest: (message) => AppError.api(400, message),
      server: (message) => AppError.api(500, message),
      cache: (message) => AppError.cache(message),
      parse: (message) => AppError.invalidData(message),
    );
  }
}
