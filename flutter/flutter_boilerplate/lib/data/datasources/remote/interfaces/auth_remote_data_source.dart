import 'package:flutter_boilerplate/data/models/auth/auth_token_dto.dart';
import 'package:flutter_boilerplate/data/models/user/user_dto.dart';

abstract class AuthRemoteDataSource {
  Future<AuthTokenDTO> signIn({
    required String email,
    required String password,
  });

  Future<void> signOut({
    required String accessToken,
  });

  Future<AuthTokenDTO> refreshToken({
    required String refreshToken,
  });

  Future<UserDTO> getCurrentUser({
    required String accessToken,
  });

  Future<void> sendPasswordResetEmail({
    required String email,
  });

  Future<void> updatePassword({
    required String accessToken,
    required String oldPassword,
    required String newPassword,
  });

  Future<void> updateEmail({
    required String accessToken,
    required String newEmail,
    required String password,
  });
}
