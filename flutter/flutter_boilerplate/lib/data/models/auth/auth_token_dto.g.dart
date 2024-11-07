// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_token_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AuthTokenDTOImpl _$$AuthTokenDTOImplFromJson(Map<String, dynamic> json) =>
    _$AuthTokenDTOImpl(
      accessToken: json['access_token'] as String,
      refreshToken: json['refresh_token'] as String,
      expiresAt: DateTime.parse(json['expires_at'] as String),
    );

Map<String, dynamic> _$$AuthTokenDTOImplToJson(_$AuthTokenDTOImpl instance) =>
    <String, dynamic>{
      'access_token': instance.accessToken,
      'refresh_token': instance.refreshToken,
      'expires_at': instance.expiresAt.toIso8601String(),
    };
