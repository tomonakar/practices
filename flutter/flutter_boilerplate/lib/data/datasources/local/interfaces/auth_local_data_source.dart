import 'package:flutter_boilerplate/data/models/auth/auth_token_dto.dart';
import 'package:flutter_boilerplate/data/models/user/user_dto.dart';

abstract class AuthLocalDataSource {
  Future<void> saveAuthToken(AuthTokenDTO token);

  Future<AuthTokenDTO?> getAuthToken();

  Future<void> deleteAuthToken();

  Future<void> saveCurrentUser(UserDTO user);

  Future<UserDTO?> getCurrentUser();

  Future<void> deleteCurrentUser();

  Future<bool> hasValidAuthToken();
}
