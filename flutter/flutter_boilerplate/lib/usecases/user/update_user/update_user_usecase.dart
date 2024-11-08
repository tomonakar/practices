import 'package:flutter_boilerplate/domain/common/result.dart';
import 'package:flutter_boilerplate/domain/entities/user/user.dart';
import 'package:flutter_boilerplate/domain/repositories/user/user_repository.dart';
import 'package:flutter_boilerplate/usecases/base/usecase.dart';
import 'package:flutter_boilerplate/usecases/user/update_user/update_user_params.dart';

class UpdateUserUseCase implements UseCase<void, UpdateUserParams> {
  final UserRepository _repository;

  UpdateUserUseCase(this._repository);

  @override
  Future<Result<User>> execute(UpdateUserParams params) async {
    // 1. 既存のユーザー情報を取得
    final currentUserResult = await _repository.getUser(params.userId);

    return currentUserResult.when(
      success: (currentUser) {
        // 2. 更新したい項目だけを変更して新しいユーザーオブジェクトを作成
        final updatedUser = currentUser.copyWith(
          name: params.name,
          email: params.email,
        );

        // 3. 更新を実行
        return _repository.updateUser(updatedUser);
      },
      failure: (error) => Result.failure(error),
    );
  }
}
