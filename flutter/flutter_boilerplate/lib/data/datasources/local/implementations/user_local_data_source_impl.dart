import 'package:shared_preferences/shared_preferences.dart' as prefs;
import 'package:sqlite3/sqlite3.dart';
import 'package:flutter_boilerplate/data/datasources/local/interfaces/user_local_data_source.dart';
import 'package:flutter_boilerplate/data/models/user/user_dto.dart';
import 'package:flutter_boilerplate/data/datasources/data_source_exception.dart';

class UserLocalDataSourceImpl implements UserLocalDataSource {
  final prefs.SharedPreferences _prefs;
  final Database _db;

  UserLocalDataSourceImpl(this._prefs, this._db);

  static const _keyPrefix = 'user_cache_';
  static const _timePrefix = 'user_cache_time_';

  @override
  Future<void> cacheUser(UserDTO user) async {
    try {
      final stmt = _db.prepare('''
        INSERT OR REPLACE INTO users (
          id, name, email, profile_image_url, created_at, updated_at, cache_time
        ) VALUES (?, ?, ?, ?, ?, ?, ?)
      ''');

      stmt.execute([
        user.id,
        user.name,
        user.email,
        user.profileImageUrl,
        user.createdAt.toIso8601String(),
        user.updatedAt.toIso8601String(),
        DateTime.now().toIso8601String(),
      ]);

      stmt.dispose();
    } catch (e) {
      throw DataSourceException.cache(message: 'ユーザー情報のキャッシュに失敗しました: $e');
    }
  }

  @override
  Future<UserDTO?> getCachedUser(String userId) async {
    try {
      final stmt = _db.prepare(
        'SELECT * FROM users WHERE id = ? LIMIT 1',
      );

      final result = stmt.select([userId]);
      stmt.dispose();

      if (result.isEmpty) {
        return null;
      }

      final row = result.first;
      return UserDTO(
        id: row['id'] as String,
        name: row['name'] as String,
        email: row['email'] as String,
        profileImageUrl: row['profile_image_url'] as String?,
        createdAt: DateTime.parse(row['created_at'] as String),
        updatedAt: DateTime.parse(row['updated_at'] as String),
      );
    } catch (e) {
      throw DataSourceException.cache(message: 'キャッシュの取得に失敗しました: $e');
    }
  }

  @override
  Future<void> deleteCachedUser(String userId) async {
    try {
      final stmt = _db.prepare('DELETE FROM users WHERE id = ?');
      stmt.execute([userId]);
      stmt.dispose();
    } catch (e) {
      throw DataSourceException.cache(message: 'キャッシュの削除に失敗しました: $e');
    }
  }

  @override
  Future<List<UserDTO>> getCachedUsers() async {
    try {
      final stmt = _db.prepare('SELECT * FROM users');
      final results = stmt.select();
      stmt.dispose();

      return results
          .map((row) => UserDTO(
                id: row['id'] as String,
                name: row['name'] as String,
                email: row['email'] as String,
                profileImageUrl: row['profile_image_url'] as String?,
                createdAt: DateTime.parse(row['created_at'] as String),
                updatedAt: DateTime.parse(row['updated_at'] as String),
              ))
          .toList();
    } catch (e) {
      throw DataSourceException.cache(message: 'キャッシュの取得に失敗しました: $e');
    }
  }

  @override
  Future<DateTime?> getLastCacheTime(String userId) async {
    try {
      final stmt = _db.prepare(
        'SELECT cache_time FROM users WHERE id = ? LIMIT 1',
      );

      final result = stmt.select([userId]);
      stmt.dispose();

      if (result.isEmpty) {
        return null;
      }

      return DateTime.parse(result.first['cache_time'] as String);
    } catch (e) {
      throw DataSourceException.cache(message: 'キャッシュ時間の取得に失敗しました: $e');
    }
  }

  @override
  Future<void> clearCache() async {
    try {
      _db.execute('DELETE FROM users');
    } catch (e) {
      throw DataSourceException.cache(message: 'キャッシュのクリアに失敗しました: $e');
    }
  }

  @override
  Future<void> cacheUserProfile(UserProfileDTO profile) async {
    try {
      final stmt = _db.prepare('''
        INSERT OR REPLACE INTO user_profiles (
          user_id, name, email, profile_image_url, created_at, updated_at, cache_time
        ) VALUES (?, ?, ?, ?, ?, ?, ?)
      ''');

      stmt.execute([
        profile.id,
        profile.name,
        profile.location,
        profile.website,
        profile.birthday,
        profile.preferences,
        DateTime.now().toIso8601String(),
      ]);

      stmt.dispose();
    } catch (e) {
      throw DataSourceException.cache(message: 'ユーザープロフィールのキャッシュに失敗しました: $e');
    }
  }

  @override
  Future<void> deleteCachedUserProfile(String userId) async {
    try {
      final stmt = _db.prepare('DELETE FROM user_profiles WHERE user_id = ?');
      stmt.execute([userId]);
      stmt.dispose();
    } catch (e) {
      throw DataSourceException.cache(message: 'ユーザープロフィールの削除に失敗しました: $e');
    }
  }

  @override
  Future<UserProfileDTO?> getCachedUserProfile(String userId) async {
    try {
      final stmt = _db.prepare(
        'SELECT * FROM user_profiles WHERE user_id = ? LIMIT 1',
      );

      final result = stmt.select([userId]);
      stmt.dispose();

      if (result.isEmpty) {
        return null;
      }

      final row = result.first;
      return UserProfileDTO(
        id: row['user_id'] as String,
        name: row['name'] as String,
        location: row['location'] as String?,
        website: row['website'] as String?,
        birthday: DateTime.parse(row['birth_date'] as String),
        preferences: row['preferences'] as Map<String, dynamic>,
      );
    } catch (e) {
      throw DataSourceException.cache(message: 'ユーザープロフィールの取得に失敗しました: $e');
    }
  }
}
