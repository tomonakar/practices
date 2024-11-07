import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_boilerplate/domain/entities/user/user.dart';

part 'auth_state.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState({
    User? user,
    @Default(false) bool isLoading,
    @Default(false) bool isAuthenticated,
    String? error,
  }) = _AuthState;
}
