import 'package:flutter_boilerplate/data/models/response/pagination_meta.dart';
import 'package:flutter_boilerplate/data/models/user/user_dto.dart';

abstract class UserRemoteDataSource {
  Future<UserDTO> getUser({
    required String accessToken,
    required String userId,
  });

  Future<UserProfileDTO> getUserProfile({
    required String accessToken,
    required String userId,
  });

  Future<UserDTO> updateUser({
    required String accessToken,
    required String userId,
    required Map<String, dynamic> userData,
  });

  Future<UserProfileDTO> updateUserProfile({
    required String accessToken,
    required String userId,
    required Map<String, dynamic> profileData,
  });

  Future<void> deleteUser({
    required String accessToken,
    required String userId,
  });

  Future<(List<UserDTO>, PaginationMeta)> getUsers({
    required String accessToken,
    int? page,
    int? limit,
    String? query,
  });
}
