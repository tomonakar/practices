import 'package:flutter_boilerplate/domain/common/result.dart';
import 'package:flutter_boilerplate/domain/entities/user/user.dart';
import 'package:flutter_boilerplate/domain/repositories/user/user_repository.dart';
import 'package:flutter_boilerplate/usecases/base/usecase.dart';
import 'package:flutter_boilerplate/usecases/user/get_user/get_user_params.dart';

class GetUserUseCase implements UseCase<User, GetUserParams> {
  final UserRepository _userRepository;

  GetUserUseCase(this._userRepository);

  @override
  Future<Result<User>> execute(GetUserParams params) async {
    return _userRepository.getUser(
      params.userId,
      forceRefresh: params.forceRefresh,
    );
  }
}
