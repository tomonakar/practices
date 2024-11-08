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

      final localDataSource = _localDataSource;
      await localDataSource.saveAuthToken(token);

      final user = await _remoteDataSource.getCurrentUser(
        accessToken: token.accessToken,
      );
      await localDataSource.saveCurrentUser(user);

      return Result.success(user.toDomain());
    } on DataSourceException catch (e) {
      return Result.failure(_mapDataSourceError(e));
    }
  }

  @override
  Future<Result<void>> signOut() async {
    try {
      final localDataSource = _localDataSource;
      final token = await localDataSource.getAuthToken();
      if (token != null) {
        await _remoteDataSource.signOut(accessToken: token.accessToken);
      }
      await localDataSource.deleteAuthToken();
      await localDataSource.deleteCurrentUser();
      return const Result.success(null);
    } on DataSourceException catch (e) {
      return Result.failure(_mapDataSourceError(e));
    }
  }

  @override
  Future<Result<User?>> getCurrentUser() async {
    try {
      final localDataSource = _localDataSource;

      // まずローカルをチェック
      final cachedUser = await localDataSource.getCurrentUser();
      if (cachedUser != null) {
        return Result.success(cachedUser.toDomain());
      }

      // トークンがある場合はリモートから取得
      // ローカルストレージからトークンを確認
      final token = await localDataSource.getAuthToken();
      if (token != null) {
        final user = await _remoteDataSource.getCurrentUser(
          accessToken: token.accessToken,
        );
        await localDataSource.saveCurrentUser(user);
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
      final localDataSource = _localDataSource;
      await localDataSource.saveAuthToken(newToken);
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
      final localDataSource = _localDataSource;
      final token = await localDataSource.getAuthToken();
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

  @override
  Future<Result<AuthToken?>> getAuthToken() async {
    try {
      final localDataSource = _localDataSource;
      final token = await localDataSource.getAuthToken();

      if (token == null) {
        return const Result.success(null);
      }

      return Result.success(token.toDomain());
    } on DataSourceException catch (e) {
      return Result.failure(_mapDataSourceError(e));
    } catch (e) {
      return Result.failure(AppError.unknown(message: e.toString()));
    }
  }

  @override
  Future<Result<void>> updateEmail({
    required String newEmail,
    required String password,
  }) async {
    try {
      final localDataSource = _localDataSource;
      final token = await localDataSource.getAuthToken();

      if (token == null) {
        return const Result.failure(AppError.unauthorized());
      }

      await _remoteDataSource.updateEmail(
        accessToken: token.accessToken,
        newEmail: newEmail,
        password: password,
      );

      // 現在のユーザー情報を更新
      final currentUser = await localDataSource.getCurrentUser();
      if (currentUser != null) {
        await localDataSource.saveCurrentUser(
          currentUser.copyWith(email: newEmail),
        );
      }

      return const Result.success(null);
    } on DataSourceException catch (e) {
      return Result.failure(_mapDataSourceError(e));
    } catch (e) {
      return Result.failure(AppError.unknown(message: e.toString()));
    }
  }

  // DataSourceExceptionをAppErrorに変換するヘルパーメソッド
  AppError _mapDataSourceError(DataSourceException exception) {
    return exception.when(
      network: (message) => AppError.network(message: message),
      notFound: (message) => AppError.api(statusCode: 404),
      unauthorized: (message) => AppError.unauthorized(message: message),
      badRequest: (message) => AppError.api(statusCode: 400, message: message),
      server: (message) => AppError.api(statusCode: 500, message: message),
      cache: (message) => AppError.cache(message: message),
      parse: (message) => AppError.invalidData(message: message),
      unknown: (message) => AppError.unknown(message: message),
    );
  }
}
