import 'package:flutter_boilerplate/data/models/user/user_dto.dart';

abstract class UserLocalDataSource {
  Future<void> cacheUser(UserDTO user);

  Future<UserDTO?> getCachedUser(String userId);

  Future<void> deleteCachedUser(String userId);

  Future<List<UserDTO>> getCachedUsers();

  Future<void> clearCache();

  Future<DateTime?> getLastCacheTime(String userId);

  Future<void> cacheUserProfile(UserProfileDTO profile);

  Future<UserProfileDTO?> getCachedUserProfile(String userId);

  Future<void> deleteCachedUserProfile(String userId);
}
