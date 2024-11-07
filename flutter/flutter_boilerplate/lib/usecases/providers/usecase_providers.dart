// lib/usecases/providers/usecase_providers.dart
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_boilerplate/domain/repositories/auth/auth_repository.dart';
import 'package:flutter_boilerplate/domain/repositories/user/user_repository.dart';
import '../repositories/auth/auth_repository_impl.dart';
import '../repositories/user/user_repository_impl.dart';
part 'usecase_providers.g.dart';

@Riverpod(keepAlive: true)
SignInUseCase signInUseCase(Ref ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return SignInUseCase(authRepository);
}

@Riverpod(keepAlive: true)
GetCurrentUserUseCase getCurrentUserUseCase(Ref ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return GetCurrentUserUseCase(authRepository);
}

@Riverpod(keepAlive: true)
GetUserUseCase getUserUseCase(Ref ref) {
  final userRepository = ref.watch(userRepositoryProvider);
  return GetUserUseCase(userRepository);
}

@Riverpod(keepAlive: true)
UpdateUserUseCase updateUserUseCase(Ref ref) {
  final userRepository = ref.watch(userRepositoryProvider);
  return UpdateUserUseCase(userRepository);
}