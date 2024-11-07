import 'package:flutter_boilerplate/domain/entities/common/result.dart';
import 'package:flutter_boilerplate/domain/entities/user/user.dart';
import 'package:flutter_boilerplate/domain/repositories/user/user_repository.dart';
import 'package:flutter_boilerplate/usecases/base/usecase.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_user_usecase.freezed.dart';

@freezed
class GetUserParams with _$GetUserParams {
  const factory GetUserParams({
    required String userId,
    @Default(false) bool forceRefresh,
  }) = _GetUserParams;
}

class GetUserUseCase implements UseCase<User, GetUserParams> {
  final UserRepository _userRepository;

  GetUserUseCase(this._userRepository);

  @override
  Future<Result<User>> execute(GetUserParams params) async {
    return _userRepository.getUser(
      params.userId,
      params.forceRefresh,
    );
  }
}
