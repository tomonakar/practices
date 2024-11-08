// lib/domain/entities/auth/auth_token.dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_token.freezed.dart';

@freezed
class AuthToken with _$AuthToken {
  const factory AuthToken({
    required String accessToken,
    required String refreshToken,
    required DateTime expiresAt,
    required DateTime serverTime, // サーバー時間を追加
  }) = _AuthToken;

  const AuthToken._();

  bool get isExpired {
    final now = DateTime.now();
    final timeDifference = now.difference(serverTime);
    final adjustedExpiryTime = expiresAt.add(timeDifference);
    return now.isAfter(adjustedExpiryTime);
  }

  bool get needsRefresh {
    final now = DateTime.now();
    final timeDifference = now.difference(serverTime);
    final adjustedExpiryTime = expiresAt.add(timeDifference);
    final thirtyMinutesBefore =
        adjustedExpiryTime.subtract(const Duration(minutes: 30));
    return now.isAfter(thirtyMinutesBefore);
  }
}
