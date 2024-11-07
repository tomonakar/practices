// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_token_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AuthTokenDTO _$AuthTokenDTOFromJson(Map<String, dynamic> json) {
  return _AuthTokenDTO.fromJson(json);
}

/// @nodoc
mixin _$AuthTokenDTO {
  @JsonKey(name: 'access_token')
  String get accessToken => throw _privateConstructorUsedError;
  @JsonKey(name: 'refresh_token')
  String get refreshToken => throw _privateConstructorUsedError;
  @JsonKey(name: 'expires_at')
  DateTime get expiresAt => throw _privateConstructorUsedError;

  /// Serializes this AuthTokenDTO to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AuthTokenDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AuthTokenDTOCopyWith<AuthTokenDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthTokenDTOCopyWith<$Res> {
  factory $AuthTokenDTOCopyWith(
          AuthTokenDTO value, $Res Function(AuthTokenDTO) then) =
      _$AuthTokenDTOCopyWithImpl<$Res, AuthTokenDTO>;
  @useResult
  $Res call(
      {@JsonKey(name: 'access_token') String accessToken,
      @JsonKey(name: 'refresh_token') String refreshToken,
      @JsonKey(name: 'expires_at') DateTime expiresAt});
}

/// @nodoc
class _$AuthTokenDTOCopyWithImpl<$Res, $Val extends AuthTokenDTO>
    implements $AuthTokenDTOCopyWith<$Res> {
  _$AuthTokenDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthTokenDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = null,
    Object? refreshToken = null,
    Object? expiresAt = null,
  }) {
    return _then(_value.copyWith(
      accessToken: null == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      refreshToken: null == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
      expiresAt: null == expiresAt
          ? _value.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AuthTokenDTOImplCopyWith<$Res>
    implements $AuthTokenDTOCopyWith<$Res> {
  factory _$$AuthTokenDTOImplCopyWith(
          _$AuthTokenDTOImpl value, $Res Function(_$AuthTokenDTOImpl) then) =
      __$$AuthTokenDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'access_token') String accessToken,
      @JsonKey(name: 'refresh_token') String refreshToken,
      @JsonKey(name: 'expires_at') DateTime expiresAt});
}

/// @nodoc
class __$$AuthTokenDTOImplCopyWithImpl<$Res>
    extends _$AuthTokenDTOCopyWithImpl<$Res, _$AuthTokenDTOImpl>
    implements _$$AuthTokenDTOImplCopyWith<$Res> {
  __$$AuthTokenDTOImplCopyWithImpl(
      _$AuthTokenDTOImpl _value, $Res Function(_$AuthTokenDTOImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthTokenDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = null,
    Object? refreshToken = null,
    Object? expiresAt = null,
  }) {
    return _then(_$AuthTokenDTOImpl(
      accessToken: null == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      refreshToken: null == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
      expiresAt: null == expiresAt
          ? _value.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AuthTokenDTOImpl extends _AuthTokenDTO {
  const _$AuthTokenDTOImpl(
      {@JsonKey(name: 'access_token') required this.accessToken,
      @JsonKey(name: 'refresh_token') required this.refreshToken,
      @JsonKey(name: 'expires_at') required this.expiresAt})
      : super._();

  factory _$AuthTokenDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$AuthTokenDTOImplFromJson(json);

  @override
  @JsonKey(name: 'access_token')
  final String accessToken;
  @override
  @JsonKey(name: 'refresh_token')
  final String refreshToken;
  @override
  @JsonKey(name: 'expires_at')
  final DateTime expiresAt;

  @override
  String toString() {
    return 'AuthTokenDTO(accessToken: $accessToken, refreshToken: $refreshToken, expiresAt: $expiresAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthTokenDTOImpl &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken) &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken) &&
            (identical(other.expiresAt, expiresAt) ||
                other.expiresAt == expiresAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, accessToken, refreshToken, expiresAt);

  /// Create a copy of AuthTokenDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthTokenDTOImplCopyWith<_$AuthTokenDTOImpl> get copyWith =>
      __$$AuthTokenDTOImplCopyWithImpl<_$AuthTokenDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AuthTokenDTOImplToJson(
      this,
    );
  }
}

abstract class _AuthTokenDTO extends AuthTokenDTO {
  const factory _AuthTokenDTO(
          {@JsonKey(name: 'access_token') required final String accessToken,
          @JsonKey(name: 'refresh_token') required final String refreshToken,
          @JsonKey(name: 'expires_at') required final DateTime expiresAt}) =
      _$AuthTokenDTOImpl;
  const _AuthTokenDTO._() : super._();

  factory _AuthTokenDTO.fromJson(Map<String, dynamic> json) =
      _$AuthTokenDTOImpl.fromJson;

  @override
  @JsonKey(name: 'access_token')
  String get accessToken;
  @override
  @JsonKey(name: 'refresh_token')
  String get refreshToken;
  @override
  @JsonKey(name: 'expires_at')
  DateTime get expiresAt;

  /// Create a copy of AuthTokenDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthTokenDTOImplCopyWith<_$AuthTokenDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
