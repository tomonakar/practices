import 'package:flutter_boilerplate/domain/entities/auth/auth_token.dart';
import 'package:flutter_boilerplate/domain/common/result.dart';
import 'package:flutter_boilerplate/domain/entities/user/user.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

part 'auth_repository.g.dart';

abstract class AuthRepository {
  /// サインイン
  Future<Result<User>> signIn({
    required String email,
    required String password,
  });

  /// サインアウト
  Future<Result<void>> signOut();

  /// 現在のユーザー情報の取得
  Future<Result<User?>> getCurrentUser();

  /// アクセストークンの取得
  Future<Result<AuthToken?>> getAuthToken();

  /// トークンの更新
  Future<Result<AuthToken>> refreshToken(String refreshToken);

  /// パスワードリセットメールの送信
  Future<Result<void>> sendPasswordResetEmail(String email);

  /// パスワードの更新
  Future<Result<void>> updatePassword({
    required String oldPassword,
    required String newPassword,
  });

  /// メールアドレスの更新
  Future<Result<void>> updateEmail({
    required String newEmail,
    required String password,
  });
}

@riverpod
AuthRepository authRepository(Ref ref) {
  throw UnimplementedError('Provider was not initialized');
}
