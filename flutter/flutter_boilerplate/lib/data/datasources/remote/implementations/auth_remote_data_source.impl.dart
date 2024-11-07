// lib/data/datasources/remote/implementations/auth_remote_data_source_impl.dart
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_boilerplate/data/datasources/data_source_exception.dart';
import 'package:flutter_boilerplate/data/datasources/remote/api/api_client.dart';
import 'package:flutter_boilerplate/data/datasources/remote/interfaces/auth_remote_data_source.dart';
import 'package:flutter_boilerplate/data/models/auth/auth_token_dto.dart';
import 'package:flutter_boilerplate/data/models/user/user_dto.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final ApiClient _apiClient;

  AuthRemoteDataSourceImpl(this._apiClient);

  @override
  Future<AuthTokenDTO> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final httpResponse = await _apiClient.signIn({
        'email': email,
        'password': password,
      });

      final response = httpResponse.data;
      final headers = httpResponse.response.headers.map;

      if (!response.success || response.data == null) {
        throw DataSourceException.unauthorized(
          response.errorMessage ?? '認証に失敗しました',
        );
      }

      final apiResponseWithHeaders = response.copyWith(headers: headers);

      return response.data!.copyWith(
        serverTime: apiResponseWithHeaders.serverTime ?? DateTime.now().toUtc(),
      );
    } on DioException catch (e) {
      throw _handleDioException(e);
    } catch (e) {
      throw const DataSourceException.unknown();
    }
  }

  @override
  Future<void> signOut({required String accessToken}) async {
    try {
      await _apiClient.signOut('Bearer $accessToken');
    } on DioException catch (e) {
      throw _handleDioException(e);
    }
  }

  @override
  Future<UserDTO> getCurrentUser({required String accessToken}) async {
    try {
      final httpResponse =
          await _apiClient.getCurrentUser('Bearer $accessToken');
      final response = httpResponse.data;
      final headers = httpResponse.response.headers.map;

      if (!response.success || response.data == null) {
        throw DataSourceException.unauthorized(
          response.errorMessage ?? 'ユーザー情報の取得に失敗しました',
        );
      }

      return response.data!;
    } on DioException catch (e) {
      throw _handleDioException(e);
    }
  }

  @override
  Future<AuthTokenDTO> refreshToken({required String refreshToken}) async {
    try {
      final httpResponse = await _apiClient.refreshToken({
        'refresh_token': refreshToken,
      });
      final response = httpResponse.data;

      if (!response.success || response.data == null) {
        throw DataSourceException.unauthorized(
          response.errorMessage ?? 'トークンの更新に失敗しました',
        );
      }

      return response.data!;
    } on DioException catch (e) {
      throw _handleDioException(e);
    } catch (e) {
      throw const DataSourceException.unknown();
    }
  }

  @override
  Future<void> sendPasswordResetEmail({required String email}) async {
    try {
      await _apiClient.sendPasswordResetEmail({
        'email': email,
      });
    } on DioException catch (e) {
      throw _handleDioException(e);
    } catch (e) {
      throw const DataSourceException.unknown();
    }
  }

  @override
  Future<void> updateEmail({
    required String accessToken,
    required String newEmail,
    required String password,
  }) async {
    try {
      await _apiClient.updateEmail(
        'Bearer $accessToken',
        {
          'email': newEmail,
          'password': password,
        },
      );
    } on DioException catch (e) {
      throw _handleDioException(e);
    } catch (e) {
      throw const DataSourceException.unknown();
    }
  }

  @override
  Future<void> updatePassword({
    required String accessToken,
    required String oldPassword,
    required String newPassword,
  }) async {
    try {
      await _apiClient.updatePassword(
        'Bearer $accessToken',
        {
          'old_password': oldPassword,
          'new_password': newPassword,
        },
      );
    } on DioException catch (e) {
      throw _handleDioException(e);
    } catch (e) {
      throw const DataSourceException.unknown();
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
