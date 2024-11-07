// lib/data/models/auth/auth_token_dto.dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_boilerplate/domain/entities/auth/auth_token.dart';

part 'auth_token_dto.freezed.dart';
part 'auth_token_dto.g.dart';

@freezed
class AuthTokenDTO with _$AuthTokenDTO {
  const factory AuthTokenDTO({
    @JsonKey(name: 'access_token') required String accessToken,
    @JsonKey(name: 'refresh_token') required String refreshToken,
    @JsonKey(name: 'expires_at') required DateTime expiresAt,
  }) = _AuthTokenDTO;

  const AuthTokenDTO._();

  factory AuthTokenDTO.fromJson(Map<String, dynamic> json) =>
      _$AuthTokenDTOFromJson(json);

  factory AuthTokenDTO.fromDomain(AuthToken token) {
    return AuthTokenDTO(
      accessToken: token.accessToken,
      refreshToken: token.refreshToken,
      expiresAt: token.expiresAt,
    );
  }

  AuthToken toDomain() {
    return AuthToken(
      accessToken: accessToken,
      refreshToken: refreshToken,
      expiresAt: expiresAt,
    );
  }
}
