import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../entities/common/result.dart';
import '../../entities/user/user.dart';

part 'user_repository.g.dart';

abstract class UserRepository {
  /// ユーザー情報の取得
  Future<Result<User>> getUser(String id, bool forceRefresh);

  /// ユーザープロフィールの取得
  Future<Result<UserProfile>> getUserProfile(String id);

  /// ユーザー情報の更新
  Future<Result<User>> updateUser(User user);

  /// ユーザープロフィールの更新
  Future<Result<UserProfile>> updateUserProfile(UserProfile profile);

  /// 現在のユーザー情報の取得
  Future<Result<User?>> getCurrentUser();

  /// ユーザーの削除
  Future<Result<void>> deleteUser(String id);
}

@riverpod
UserRepository userRepository(Ref ref) {
  throw UnimplementedError('Provider was not initialized');
}
