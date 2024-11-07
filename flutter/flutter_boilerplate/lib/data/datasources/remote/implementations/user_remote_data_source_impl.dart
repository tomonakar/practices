import 'package:dio/dio.dart';
import 'package:flutter_boilerplate/data/datasources/data_source_exception.dart';
import 'package:flutter_boilerplate/data/datasources/remote/api/api_client.dart';
import 'package:flutter_boilerplate/data/datasources/remote/interfaces/user_remote_data_source.dart';
import 'package:flutter_boilerplate/data/models/user/user_dto.dart';
import 'package:flutter_boilerplate/data/models/response/pagination_meta.dart';

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final ApiClient _apiClient;

  UserRemoteDataSourceImpl(this._apiClient);

  @override
  Future<UserDTO> getUser({
    required String accessToken,
    required String userId,
  }) async {
    try {
      final response = await _apiClient.getUser(
        'Bearer $accessToken',
        userId,
      );

      if (!response.success || response.data == null) {
        throw DataSourceException.notFound(
          response.errorMessage ?? 'ユーザーが見つかりません',
        );
      }

      return response.data!;
    } on DioException catch (e) {
      throw _handleDioException(e);
    }
  }

  @override
  Future<UserDTO> updateUser({
    required String accessToken,
    required String userId,
    required Map<String, dynamic> userData,
  }) async {
    try {
      final response = await _apiClient.updateUser(
        'Bearer $accessToken',
        userId,
        userData,
      );

      if (!response.success || response.data == null) {
        throw DataSourceException.badRequest(
          response.errorMessage ?? 'ユーザー情報の更新に失敗しました',
        );
      }

      return response.data!;
    } on DioException catch (e) {
      throw _handleDioException(e);
    }
  }

  @override
  Future<void> deleteUser({
    required String accessToken,
    required String userId,
  }) async {
    try {
      await _apiClient.deleteUser(
        'Bearer $accessToken',
        userId,
      );
    } on DioException catch (e) {
      throw _handleDioException(e);
    }
  }

  @override
  Future<(List<UserDTO>, PaginationMeta)> getUsers({
    required String accessToken,
    int? page,
    int? limit,
    String? query,
  }) async {
    try {
      final queryParams = {
        if (page != null) 'page': page.toString(),
        if (limit != null) 'limit': limit.toString(),
        if (query != null && query.isNotEmpty) 'q': query,
      };

      final response = await _apiClient.getUsers(
        'Bearer $accessToken',
        queryParams,
      );

      if (!response.success || response.data == null) {
        throw const DataSourceException.badRequest('ユーザー一覧の取得に失敗しました');
      }

      return (
        response.data!.items,
        response.data!.meta,
      );
    } on DioException catch (e) {
      throw _handleDioException(e);
    }
  }

  @override
  Future<UserProfileDTO> getUserProfile({
    required String accessToken,
    required String userId,
  }) async {
    try {
      final response = await _apiClient.getUserProfile(
        'Bearer $accessToken',
        userId,
      );

      if (!response.success || response.data == null) {
        throw DataSourceException.notFound(
          response.errorMessage ?? 'ユーザープロフィールが見つかりません',
        );
      }

      return response.data!;
    } on DioException catch (e) {
      throw _handleDioException(e);
    }
  }

  @override
  Future<UserProfileDTO> updateUserProfile({
    required String accessToken,
    required String userId,
    required Map<String, dynamic> profileData,
  }) async {
    try {
      final response = await _apiClient.updateUserProfile(
        'Bearer $accessToken',
        userId,
        profileData,
      );

      if (!response.success || response.data == null) {
        throw DataSourceException.badRequest(
          response.errorMessage ?? 'プロフィールの更新に失敗しました',
        );
      }

      return response.data!;
    } on DioException catch (e) {
      throw _handleDioException(e);
    }
  }

  DataSourceException _handleDioException(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return const DataSourceException.network('接続がタイムアウトしました');

      case DioExceptionType.badResponse:
        final statusCode = error.response?.statusCode;
        switch (statusCode) {
          case 400:
            return DataSourceException.badRequest(
              error.response?.data?['message'] ?? '不正なリクエストです',
            );
          case 401:
            return DataSourceException.unauthorized(
              error.response?.data?['message'] ?? '認証エラーが発生しました',
            );
          case 404:
            return DataSourceException.notFound(
              error.response?.data?['message'] ?? 'リソースが見つかりません',
            );
          case 500:
            return DataSourceException.server(
              error.response?.data?['message'] ?? 'サーバーエラーが発生しました',
            );
          default:
            return DataSourceException.unknown(
              error.response?.data?['message'] ?? '予期せぬエラーが発生しました',
            );
        }

      default:
        return const DataSourceException.network('ネットワークエラーが発生しました');
    }
  }
}
