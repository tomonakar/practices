// lib/usecases/auth/sign_in_usecase.dart
import 'package:flutter_boilerplate/domain/repositories/auth/auth_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/common/result.dart';
import '../../domain/entities/user/user.dart';
import '../base/usecase.dart';

part 'sign_in_usecase.freezed.dart';

@freezed
class SignInParams with _$SignInParams {
  const factory SignInParams({
    required String email,
    required String password,
  }) = _SignInParams;
}

class SignInUseCase implements UseCase<User, SignInParams> {
  final AuthRepository _authRepository;

  SignInUseCase(this._authRepository);

  @override
  Future<Result<User>> execute(SignInParams params) async {
    return _authRepository.signIn(
      email: params.email,
      password: params.password,
    );
  }
}
