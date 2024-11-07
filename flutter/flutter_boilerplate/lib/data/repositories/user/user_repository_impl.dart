// lib/data/repositories/user/user_repository_impl.dart
import 'package:flutter_boilerplate/data/datasources/data_source_exception.dart';
import 'package:flutter_boilerplate/data/datasources/local/cache_config.dart';
import 'package:flutter_boilerplate/data/datasources/local/interfaces/auth_local_data_source.dart';
import 'package:flutter_boilerplate/data/datasources/local/interfaces/user_local_data_source.dart';
import 'package:flutter_boilerplate/data/datasources/remote/interfaces/auth_remote_data_source.dart';
import 'package:flutter_boilerplate/data/datasources/remote/interfaces/user_remote_data_source.dart';
import 'package:flutter_boilerplate/domain/common/result.dart';
import 'package:flutter_boilerplate/domain/entities/user/user.dart';
import 'package:flutter_boilerplate/domain/repositories/user/user_repository.dart';
import 'package:flutter_boilerplate/domain/values/app_error.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource _remoteDataSource;
  final AuthRemoteDataSource _authRemoteDataSource;
  final UserLocalDataSource _localDataSource;
  final AuthLocalDataSource _authLocalDataSource;

  UserRepositoryImpl(
    this._remoteDataSource,
    this._authRemoteDataSource,
    this._localDataSource,
    this._authLocalDataSource,
  );

  @override
  Future<Result<User?>> getCurrentUser() async {
    try {
      // まずローカルストレージからトークンを確認
      final token = await _authLocalDataSource.getAuthToken();
      if (token == null) {
        return const Result.success(null);
      }

      // トークンが期限切れの場合
      if (token.isExpired) {
        return const Result.failure(AppError.unauthorized('認証の有効期限が切れています'));
      }

      // ローカルにキャッシュされたユーザー情報を確認
      final cachedUser = await _authLocalDataSource.getCurrentUser();
      if (cachedUser != null) {
        return Result.success(cachedUser.toDomain());
      }

      // APIからユーザー情報を取得
      final userDTO = await _authRemoteDataSource.getCurrentUser(
        accessToken: token.accessToken,
      );

      // 取得したユーザー情報をキャッシュ
      await _authLocalDataSource.saveCurrentUser(userDTO);

      return Result.success(userDTO.toDomain());
    } on DataSourceException catch (e) {
      // 認証エラーの場合は、ローカルのデータをクリア
      if (e is UnauthorizedException) {
        await _authLocalDataSource.deleteAuthToken();
        await _authLocalDataSource.deleteCurrentUser();
      }
      return Result.failure(_mapDataSourceError(e));
    } catch (e) {
      return Result.failure(AppError.unknown(e.toString()));
    }
  }

  @override
  Future<Result<User>> getUser(
    String id, {
    bool forceRefresh = false,
  }) async {
    try {
      // キャッシュチェック（強制リフレッシュでない場合）
      if (!forceRefresh) {
        final lastCacheTime = await _localDataSource.getLastCacheTime(id);
        final cachedUser = await _localDataSource.getCachedUser(id);

        if (cachedUser != null && CacheConfig.isValidCache(lastCacheTime)) {
          return Result.success(cachedUser.toDomain());
        }
      }

      // トークンの取得
      final token = await _authLocalDataSource.getAuthToken();
      if (token == null) {
        return const Result.failure(AppError.unauthorized());
      }

      // リモートからデータ取得
      final user = await _remoteDataSource.getUser(
        accessToken: token.accessToken,
        userId: id,
      );

      // キャッシュの更新
      await _localDataSource.cacheUser(user);

      return Result.success(user.toDomain());
    } on DataSourceException catch (e) {
      // エラー時にキャッシュがあればそれを返す
      try {
        final cachedUser = await _localDataSource.getCachedUser(id);
        if (cachedUser != null) {
          return Result.success(cachedUser.toDomain());
        }
      } catch (_) {
        // キャッシュの取得に失敗した場合は無視
      }

      return Result.failure(_mapDataSourceError(e));
    }
  }

  @override
  Future<Result<void>> deleteUser(String id) async {
    try {
      final token = await _authLocalDataSource.getAuthToken();
      if (token == null) {
        return const Result.failure(AppError.unauthorized());
      }

      await _remoteDataSource.deleteUser(
        accessToken: token.accessToken,
        userId: id,
      );

      // ローカルキャッシュの削除
      await _localDataSource.deleteCachedUser(id);

      return const Result.success(null);
    } on DataSourceException catch (e) {
      return Result.failure(_mapDataSourceError(e));
    }
  }

  @override
  Future<Result<User>> updateUser(User user) async {
    try {
      final token = await _authLocalDataSource.getAuthToken();
      if (token == null) {
        return const Result.failure(AppError.unauthorized());
      }

      final updatedUser = await _remoteDataSource.updateUser(
        accessToken: token.accessToken,
        userId: user.id,
        userData: {
          'name': user.name,
          'email': user.email,
          'profile_image_url': user.profileImageUrl,
        },
      );

      // キャッシュの更新
      await _localDataSource.cacheUser(updatedUser);

      return Result.success(updatedUser.toDomain());
    } on DataSourceException catch (e) {
      return Result.failure(_mapDataSourceError(e));
    }
  }

  @override
  Future<Result<UserProfile>> getUserProfile(
    String id, {
    bool forceRefresh = false,
  }) async {
    try {
      // キャッシュチェック（強制リフレッシュでない場合）
      if (!forceRefresh) {
        final lastCacheTime = await _localDataSource.getLastCacheTime(id);
        final cachedProfile = await _localDataSource.getCachedUserProfile(id);

        if (cachedProfile != null && CacheConfig.isValidCache(lastCacheTime)) {
          return Result.success(cachedProfile.toDomain());
        }
      }

      // トークンの取得
      final token = await _authLocalDataSource.getAuthToken();
      if (token == null) {
        return const Result.failure(AppError.unauthorized());
      }

      // リモートからデータ取得
      final profile = await _remoteDataSource.getUserProfile(
        accessToken: token.accessToken,
        userId: id,
      );

      // キャッシュの更新
      await _localDataSource.cacheUserProfile(profile);

      return Result.success(profile.toDomain());
    } on DataSourceException catch (e) {
      // エラー時にキャッシュがあればそれを返す
      try {
        final cachedProfile = await _localDataSource.getCachedUserProfile(id);
        if (cachedProfile != null) {
          return Result.success(cachedProfile.toDomain());
        }
      } catch (_) {
        // キャッシュの取得に失敗した場合は無視
      }

      return Result.failure(_mapDataSourceError(e));
    }
  }

  @override
  Future<Result<UserProfile>> updateUserProfile(UserProfile profile) async {
    try {
      final token = await _authLocalDataSource.getAuthToken();
      if (token == null) {
        return const Result.failure(AppError.unauthorized());
      }

      final updatedProfile = await _remoteDataSource.updateUserProfile(
        accessToken: token.accessToken,
        userId: profile.id,
        profileData: {
          'name': profile.name,
          'bio': profile.bio,
          'location': profile.location,
          'website': profile.website,
          'birth_date': profile.birthday.toIso8601String(),
          'preferences': profile.preferences,
        },
      );

      // キャッシュの更新
      await _localDataSource.cacheUserProfile(updatedProfile);

      return Result.success(updatedProfile.toDomain());
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
      unknown: (message) => AppError.unknown(message),
    );
  }
}
