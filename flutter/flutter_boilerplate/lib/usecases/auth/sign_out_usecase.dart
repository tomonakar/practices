import 'package:flutter_boilerplate/domain/common/result.dart';
import 'package:flutter_boilerplate/domain/repositories/auth/auth_repository.dart';
import 'package:flutter_boilerplate/usecases/base/usecase.dart';

class SignOutUseCase implements UseCase<void, NoParams> {
  final AuthRepository _repository;

  SignOutUseCase(this._repository);

  @override
  Future<Result<void>> execute(NoParams params) {
    return _repository.signOut();
  }
}
