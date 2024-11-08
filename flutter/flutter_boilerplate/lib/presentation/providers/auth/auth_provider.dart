import 'package:flutter_boilerplate/domain/entities/auth/auth_state.dart';
import 'package:flutter_boilerplate/usecases/auth/sign_in_usecase.dart';
import 'package:flutter_boilerplate/usecases/base/usecase.dart';
import 'package:flutter_boilerplate/usecases/providers/usecase_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_provider.g.dart';

@Riverpod(keepAlive: true)
class Auth extends _$Auth {
  @override
  FutureOr<AuthState> build() async {
    final result =
        await ref.read(getCurrentUserUseCaseProvider).execute(const NoParams());

    return result.when(
      success: (user) => AuthState(
        user: user,
        isAuthenticated: user != null,
      ),
      failure: (error) => const AuthState(
        isAuthenticated: false,
        error: 'Failed to authenticate',
      ),
    );
  }

  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    state = const AsyncValue.loading();

    final result = await ref.read(signInUseCaseProvider).execute(
          SignInParams(
            email: email,
            password: password,
          ),
        );

    state = AsyncValue.data(
      result.when(
        success: (user) => AuthState(
          user: user,
          isAuthenticated: true,
        ),
        failure: (error) => AuthState(
          isAuthenticated: false,
          error: error.message,
        ),
      ),
    );
  }

  Future<void> signOut() async {
    state = const AsyncValue.loading();

    final result =
        await ref.read(signOutUseCaseProvider).execute(const NoParams());

    state = AsyncValue.data(
      result.when(
        success: (_) => AuthState(isAuthenticated: false),
        failure: (error) => AuthState(
          isAuthenticated: true,
          error: error.message,
        ),
      ),
    );
  }
}
