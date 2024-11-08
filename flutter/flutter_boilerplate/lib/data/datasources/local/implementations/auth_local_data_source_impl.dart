import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_boilerplate/data/datasources/local/interfaces/auth_local_data_source.dart';
import 'package:flutter_boilerplate/data/models/auth/auth_token_dto.dart';
import 'package:flutter_boilerplate/data/models/user/user_dto.dart';
import 'package:flutter_boilerplate/data/datasources/data_source_exception.dart';

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final SharedPreferences _prefs;
  static const keyAuthToken = 'auth_token';
  static const keyCurrentUser = 'current_user';

  AuthLocalDataSourceImpl(this._prefs);

  @override
  Future<void> saveAuthToken(AuthTokenDTO token) async {
    try {
      final tokenJson = json.encode({
        'access_token': token.accessToken,
        'refresh_token': token.refreshToken,
        'expires_at': token.expiresAt.toIso8601String(),
        'server_time': token.serverTime.toIso8601String(),
      });

      await _prefs.setString(keyAuthToken, tokenJson);
    } catch (e) {
      throw DataSourceException.cache(message: '認証トークンの保存に失敗しました: $e');
    }
  }

  @override
  Future<AuthTokenDTO?> getAuthToken() async {
    try {
      final tokenJson = _prefs.getString(keyAuthToken);
      if (tokenJson == null) {
        return null;
      }

      final tokenMap = json.decode(tokenJson) as Map<String, dynamic>;
      return AuthTokenDTO(
        accessToken: tokenMap['access_token'] as String,
        refreshToken: tokenMap['refresh_token'] as String,
        expiresAt: DateTime.parse(tokenMap['expires_at'] as String),
        serverTime: DateTime.parse(tokenMap['server_time'] as String),
      );
    } catch (e) {
      throw DataSourceException.cache(message: '認証トークンの取得に失敗しました: $e');
    }
  }

  @override
  Future<void> deleteAuthToken() async {
    try {
      await _prefs.remove(keyAuthToken);
    } catch (e) {
      throw DataSourceException.cache(message: '認証トークンの削除に失敗しました: $e');
    }
  }

  @override
  Future<void> saveCurrentUser(UserDTO user) async {
    try {
      final userJson = json.encode({
        'id': user.id,
        'name': user.name,
        'email': user.email,
        'profile_image_url': user.profileImageUrl,
        'created_at': user.createdAt.toIso8601String(),
        'updated_at': user.updatedAt.toIso8601String(),
      });

      await _prefs.setString(keyCurrentUser, userJson);
    } catch (e) {
      throw DataSourceException.cache(message: 'ユーザー情報の保存に失敗しました: $e');
    }
  }

  @override
  Future<UserDTO?> getCurrentUser() async {
    try {
      final userJson = _prefs.getString(keyCurrentUser);
      if (userJson == null) {
        return null;
      }

      final userMap = json.decode(userJson) as Map<String, dynamic>;
      return UserDTO(
        id: userMap['id'] as String,
        name: userMap['name'] as String,
        email: userMap['email'] as String,
        profileImageUrl: userMap['profile_image_url'] as String?,
        createdAt: DateTime.parse(userMap['created_at'] as String),
        updatedAt: DateTime.parse(userMap['updated_at'] as String),
      );
    } catch (e) {
      throw DataSourceException.cache(message: 'ユーザー情報の取得に失敗しました: $e');
    }
  }

  @override
  Future<void> deleteCurrentUser() async {
    try {
      await _prefs.remove(keyCurrentUser);
    } catch (e) {
      throw DataSourceException.cache(message: 'ユーザー情報の削除に失敗しました: $e');
    }
  }

  @override
  Future<bool> hasValidAuthToken() async {
    try {
      final token = await getAuthToken();
      if (token == null) {
        return false;
      }

      return !token.isExpired;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<void> clearAll() async {
    try {
      await Future.wait([
        deleteAuthToken(),
        deleteCurrentUser(),
      ]);
    } catch (e) {
      throw DataSourceException.cache(message: 'キャッシュのクリアに失敗しました: $e');
    }
  }
}
