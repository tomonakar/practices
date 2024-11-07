import 'package:flutter_boilerplate/domain/entities/common/result.dart';
import 'package:flutter_boilerplate/domain/entities/user/user.dart';
import 'package:flutter_boilerplate/domain/repositories/auth/auth_repository.dart';
import 'package:flutter_boilerplate/usecases/base/usecase.dart';

class GetCurrentUserUseCase implements UseCase<User?, NoParams> {
  final AuthRepository _authRepository;

  GetCurrentUserUseCase(this._authRepository);

  @override
  Future<Result<User?>> execute(NoParams params) async {
    return _authRepository.getCurrentUser();
  }
}
