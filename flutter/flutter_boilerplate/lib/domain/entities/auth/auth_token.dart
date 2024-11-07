// lib/domain/entities/auth/auth_token.dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_token.freezed.dart';

@freezed
class AuthToken with _$AuthToken {
  const factory AuthToken({
    required String accessToken,
    required String refreshToken,
    required DateTime expiresAt,
  }) = _AuthToken;

  const AuthToken._();

  bool get isExpired => DateTime.now().isAfter(expiresAt);

  bool get needsRefresh {
    final thirtyMinutesFromNow =
        DateTime.now().add(const Duration(minutes: 30));
    return DateTime.now()
        .isAfter(expiresAt.subtract(const Duration(minutes: 30)));
  }
}
