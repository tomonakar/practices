// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_error.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AppError {
  String? get message => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? message) network,
    required TResult Function(int? statusCode, String? message) api,
    required TResult Function(String? message) unauthorized,
    required TResult Function(String? message) unknown,
    required TResult Function(String? message) invalidData,
    required TResult Function(String? message) cache,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? message)? network,
    TResult? Function(int? statusCode, String? message)? api,
    TResult? Function(String? message)? unauthorized,
    TResult? Function(String? message)? unknown,
    TResult? Function(String? message)? invalidData,
    TResult? Function(String? message)? cache,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message)? network,
    TResult Function(int? statusCode, String? message)? api,
    TResult Function(String? message)? unauthorized,
    TResult Function(String? message)? unknown,
    TResult Function(String? message)? invalidData,
    TResult Function(String? message)? cache,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NetworkError value) network,
    required TResult Function(ApiError value) api,
    required TResult Function(UnauthorizedError value) unauthorized,
    required TResult Function(UnknownError value) unknown,
    required TResult Function(InvalidDataError value) invalidData,
    required TResult Function(CacheError value) cache,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NetworkError value)? network,
    TResult? Function(ApiError value)? api,
    TResult? Function(UnauthorizedError value)? unauthorized,
    TResult? Function(UnknownError value)? unknown,
    TResult? Function(InvalidDataError value)? invalidData,
    TResult? Function(CacheError value)? cache,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NetworkError value)? network,
    TResult Function(ApiError value)? api,
    TResult Function(UnauthorizedError value)? unauthorized,
    TResult Function(UnknownError value)? unknown,
    TResult Function(InvalidDataError value)? invalidData,
    TResult Function(CacheError value)? cache,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of AppError
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AppErrorCopyWith<AppError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppErrorCopyWith<$Res> {
  factory $AppErrorCopyWith(AppError value, $Res Function(AppError) then) =
      _$AppErrorCopyWithImpl<$Res, AppError>;
  @useResult
  $Res call({String? message});
}

/// @nodoc
class _$AppErrorCopyWithImpl<$Res, $Val extends AppError>
    implements $AppErrorCopyWith<$Res> {
  _$AppErrorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppError
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NetworkErrorImplCopyWith<$Res>
    implements $AppErrorCopyWith<$Res> {
  factory _$$NetworkErrorImplCopyWith(
          _$NetworkErrorImpl value, $Res Function(_$NetworkErrorImpl) then) =
      __$$NetworkErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? message});
}

/// @nodoc
class __$$NetworkErrorImplCopyWithImpl<$Res>
    extends _$AppErrorCopyWithImpl<$Res, _$NetworkErrorImpl>
    implements _$$NetworkErrorImplCopyWith<$Res> {
  __$$NetworkErrorImplCopyWithImpl(
      _$NetworkErrorImpl _value, $Res Function(_$NetworkErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppError
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$NetworkErrorImpl(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$NetworkErrorImpl extends NetworkError {
  const _$NetworkErrorImpl({this.message = 'ネットワークエラーが発生しました'}) : super._();

  @override
  @JsonKey()
  final String? message;

  @override
  String toString() {
    return 'AppError.network(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NetworkErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of AppError
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NetworkErrorImplCopyWith<_$NetworkErrorImpl> get copyWith =>
      __$$NetworkErrorImplCopyWithImpl<_$NetworkErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? message) network,
    required TResult Function(int? statusCode, String? message) api,
    required TResult Function(String? message) unauthorized,
    required TResult Function(String? message) unknown,
    required TResult Function(String? message) invalidData,
    required TResult Function(String? message) cache,
  }) {
    return network(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? message)? network,
    TResult? Function(int? statusCode, String? message)? api,
    TResult? Function(String? message)? unauthorized,
    TResult? Function(String? message)? unknown,
    TResult? Function(String? message)? invalidData,
    TResult? Function(String? message)? cache,
  }) {
    return network?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message)? network,
    TResult Function(int? statusCode, String? message)? api,
    TResult Function(String? message)? unauthorized,
    TResult Function(String? message)? unknown,
    TResult Function(String? message)? invalidData,
    TResult Function(String? message)? cache,
    required TResult orElse(),
  }) {
    if (network != null) {
      return network(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NetworkError value) network,
    required TResult Function(ApiError value) api,
    required TResult Function(UnauthorizedError value) unauthorized,
    required TResult Function(UnknownError value) unknown,
    required TResult Function(InvalidDataError value) invalidData,
    required TResult Function(CacheError value) cache,
  }) {
    return network(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NetworkError value)? network,
    TResult? Function(ApiError value)? api,
    TResult? Function(UnauthorizedError value)? unauthorized,
    TResult? Function(UnknownError value)? unknown,
    TResult? Function(InvalidDataError value)? invalidData,
    TResult? Function(CacheError value)? cache,
  }) {
    return network?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NetworkError value)? network,
    TResult Function(ApiError value)? api,
    TResult Function(UnauthorizedError value)? unauthorized,
    TResult Function(UnknownError value)? unknown,
    TResult Function(InvalidDataError value)? invalidData,
    TResult Function(CacheError value)? cache,
    required TResult orElse(),
  }) {
    if (network != null) {
      return network(this);
    }
    return orElse();
  }
}

abstract class NetworkError extends AppError {
  const factory NetworkError({final String? message}) = _$NetworkErrorImpl;
  const NetworkError._() : super._();

  @override
  String? get message;

  /// Create a copy of AppError
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NetworkErrorImplCopyWith<_$NetworkErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ApiErrorImplCopyWith<$Res>
    implements $AppErrorCopyWith<$Res> {
  factory _$$ApiErrorImplCopyWith(
          _$ApiErrorImpl value, $Res Function(_$ApiErrorImpl) then) =
      __$$ApiErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? statusCode, String? message});
}

/// @nodoc
class __$$ApiErrorImplCopyWithImpl<$Res>
    extends _$AppErrorCopyWithImpl<$Res, _$ApiErrorImpl>
    implements _$$ApiErrorImplCopyWith<$Res> {
  __$$ApiErrorImplCopyWithImpl(
      _$ApiErrorImpl _value, $Res Function(_$ApiErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppError
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statusCode = freezed,
    Object? message = freezed,
  }) {
    return _then(_$ApiErrorImpl(
      statusCode: freezed == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$ApiErrorImpl extends ApiError {
  const _$ApiErrorImpl({this.statusCode, this.message = 'APIエラーが発生しました'})
      : super._();

  @override
  final int? statusCode;
  @override
  @JsonKey()
  final String? message;

  @override
  String toString() {
    return 'AppError.api(statusCode: $statusCode, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApiErrorImpl &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, statusCode, message);

  /// Create a copy of AppError
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ApiErrorImplCopyWith<_$ApiErrorImpl> get copyWith =>
      __$$ApiErrorImplCopyWithImpl<_$ApiErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? message) network,
    required TResult Function(int? statusCode, String? message) api,
    required TResult Function(String? message) unauthorized,
    required TResult Function(String? message) unknown,
    required TResult Function(String? message) invalidData,
    required TResult Function(String? message) cache,
  }) {
    return api(statusCode, message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? message)? network,
    TResult? Function(int? statusCode, String? message)? api,
    TResult? Function(String? message)? unauthorized,
    TResult? Function(String? message)? unknown,
    TResult? Function(String? message)? invalidData,
    TResult? Function(String? message)? cache,
  }) {
    return api?.call(statusCode, message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message)? network,
    TResult Function(int? statusCode, String? message)? api,
    TResult Function(String? message)? unauthorized,
    TResult Function(String? message)? unknown,
    TResult Function(String? message)? invalidData,
    TResult Function(String? message)? cache,
    required TResult orElse(),
  }) {
    if (api != null) {
      return api(statusCode, message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NetworkError value) network,
    required TResult Function(ApiError value) api,
    required TResult Function(UnauthorizedError value) unauthorized,
    required TResult Function(UnknownError value) unknown,
    required TResult Function(InvalidDataError value) invalidData,
    required TResult Function(CacheError value) cache,
  }) {
    return api(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NetworkError value)? network,
    TResult? Function(ApiError value)? api,
    TResult? Function(UnauthorizedError value)? unauthorized,
    TResult? Function(UnknownError value)? unknown,
    TResult? Function(InvalidDataError value)? invalidData,
    TResult? Function(CacheError value)? cache,
  }) {
    return api?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NetworkError value)? network,
    TResult Function(ApiError value)? api,
    TResult Function(UnauthorizedError value)? unauthorized,
    TResult Function(UnknownError value)? unknown,
    TResult Function(InvalidDataError value)? invalidData,
    TResult Function(CacheError value)? cache,
    required TResult orElse(),
  }) {
    if (api != null) {
      return api(this);
    }
    return orElse();
  }
}

abstract class ApiError extends AppError {
  const factory ApiError({final int? statusCode, final String? message}) =
      _$ApiErrorImpl;
  const ApiError._() : super._();

  int? get statusCode;
  @override
  String? get message;

  /// Create a copy of AppError
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ApiErrorImplCopyWith<_$ApiErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UnauthorizedErrorImplCopyWith<$Res>
    implements $AppErrorCopyWith<$Res> {
  factory _$$UnauthorizedErrorImplCopyWith(_$UnauthorizedErrorImpl value,
          $Res Function(_$UnauthorizedErrorImpl) then) =
      __$$UnauthorizedErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? message});
}

/// @nodoc
class __$$UnauthorizedErrorImplCopyWithImpl<$Res>
    extends _$AppErrorCopyWithImpl<$Res, _$UnauthorizedErrorImpl>
    implements _$$UnauthorizedErrorImplCopyWith<$Res> {
  __$$UnauthorizedErrorImplCopyWithImpl(_$UnauthorizedErrorImpl _value,
      $Res Function(_$UnauthorizedErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppError
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$UnauthorizedErrorImpl(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$UnauthorizedErrorImpl extends UnauthorizedError {
  const _$UnauthorizedErrorImpl({this.message = '認証エラーが発生しました'}) : super._();

  @override
  @JsonKey()
  final String? message;

  @override
  String toString() {
    return 'AppError.unauthorized(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UnauthorizedErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of AppError
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UnauthorizedErrorImplCopyWith<_$UnauthorizedErrorImpl> get copyWith =>
      __$$UnauthorizedErrorImplCopyWithImpl<_$UnauthorizedErrorImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? message) network,
    required TResult Function(int? statusCode, String? message) api,
    required TResult Function(String? message) unauthorized,
    required TResult Function(String? message) unknown,
    required TResult Function(String? message) invalidData,
    required TResult Function(String? message) cache,
  }) {
    return unauthorized(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? message)? network,
    TResult? Function(int? statusCode, String? message)? api,
    TResult? Function(String? message)? unauthorized,
    TResult? Function(String? message)? unknown,
    TResult? Function(String? message)? invalidData,
    TResult? Function(String? message)? cache,
  }) {
    return unauthorized?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message)? network,
    TResult Function(int? statusCode, String? message)? api,
    TResult Function(String? message)? unauthorized,
    TResult Function(String? message)? unknown,
    TResult Function(String? message)? invalidData,
    TResult Function(String? message)? cache,
    required TResult orElse(),
  }) {
    if (unauthorized != null) {
      return unauthorized(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NetworkError value) network,
    required TResult Function(ApiError value) api,
    required TResult Function(UnauthorizedError value) unauthorized,
    required TResult Function(UnknownError value) unknown,
    required TResult Function(InvalidDataError value) invalidData,
    required TResult Function(CacheError value) cache,
  }) {
    return unauthorized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NetworkError value)? network,
    TResult? Function(ApiError value)? api,
    TResult? Function(UnauthorizedError value)? unauthorized,
    TResult? Function(UnknownError value)? unknown,
    TResult? Function(InvalidDataError value)? invalidData,
    TResult? Function(CacheError value)? cache,
  }) {
    return unauthorized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NetworkError value)? network,
    TResult Function(ApiError value)? api,
    TResult Function(UnauthorizedError value)? unauthorized,
    TResult Function(UnknownError value)? unknown,
    TResult Function(InvalidDataError value)? invalidData,
    TResult Function(CacheError value)? cache,
    required TResult orElse(),
  }) {
    if (unauthorized != null) {
      return unauthorized(this);
    }
    return orElse();
  }
}

abstract class UnauthorizedError extends AppError {
  const factory UnauthorizedError({final String? message}) =
      _$UnauthorizedErrorImpl;
  const UnauthorizedError._() : super._();

  @override
  String? get message;

  /// Create a copy of AppError
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UnauthorizedErrorImplCopyWith<_$UnauthorizedErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UnknownErrorImplCopyWith<$Res>
    implements $AppErrorCopyWith<$Res> {
  factory _$$UnknownErrorImplCopyWith(
          _$UnknownErrorImpl value, $Res Function(_$UnknownErrorImpl) then) =
      __$$UnknownErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? message});
}

/// @nodoc
class __$$UnknownErrorImplCopyWithImpl<$Res>
    extends _$AppErrorCopyWithImpl<$Res, _$UnknownErrorImpl>
    implements _$$UnknownErrorImplCopyWith<$Res> {
  __$$UnknownErrorImplCopyWithImpl(
      _$UnknownErrorImpl _value, $Res Function(_$UnknownErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppError
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$UnknownErrorImpl(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$UnknownErrorImpl extends UnknownError {
  const _$UnknownErrorImpl({this.message = '予期せぬエラーが発生しました'}) : super._();

  @override
  @JsonKey()
  final String? message;

  @override
  String toString() {
    return 'AppError.unknown(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UnknownErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of AppError
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UnknownErrorImplCopyWith<_$UnknownErrorImpl> get copyWith =>
      __$$UnknownErrorImplCopyWithImpl<_$UnknownErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? message) network,
    required TResult Function(int? statusCode, String? message) api,
    required TResult Function(String? message) unauthorized,
    required TResult Function(String? message) unknown,
    required TResult Function(String? message) invalidData,
    required TResult Function(String? message) cache,
  }) {
    return unknown(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? message)? network,
    TResult? Function(int? statusCode, String? message)? api,
    TResult? Function(String? message)? unauthorized,
    TResult? Function(String? message)? unknown,
    TResult? Function(String? message)? invalidData,
    TResult? Function(String? message)? cache,
  }) {
    return unknown?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message)? network,
    TResult Function(int? statusCode, String? message)? api,
    TResult Function(String? message)? unauthorized,
    TResult Function(String? message)? unknown,
    TResult Function(String? message)? invalidData,
    TResult Function(String? message)? cache,
    required TResult orElse(),
  }) {
    if (unknown != null) {
      return unknown(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NetworkError value) network,
    required TResult Function(ApiError value) api,
    required TResult Function(UnauthorizedError value) unauthorized,
    required TResult Function(UnknownError value) unknown,
    required TResult Function(InvalidDataError value) invalidData,
    required TResult Function(CacheError value) cache,
  }) {
    return unknown(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NetworkError value)? network,
    TResult? Function(ApiError value)? api,
    TResult? Function(UnauthorizedError value)? unauthorized,
    TResult? Function(UnknownError value)? unknown,
    TResult? Function(InvalidDataError value)? invalidData,
    TResult? Function(CacheError value)? cache,
  }) {
    return unknown?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NetworkError value)? network,
    TResult Function(ApiError value)? api,
    TResult Function(UnauthorizedError value)? unauthorized,
    TResult Function(UnknownError value)? unknown,
    TResult Function(InvalidDataError value)? invalidData,
    TResult Function(CacheError value)? cache,
    required TResult orElse(),
  }) {
    if (unknown != null) {
      return unknown(this);
    }
    return orElse();
  }
}

abstract class UnknownError extends AppError {
  const factory UnknownError({final String? message}) = _$UnknownErrorImpl;
  const UnknownError._() : super._();

  @override
  String? get message;

  /// Create a copy of AppError
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UnknownErrorImplCopyWith<_$UnknownErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$InvalidDataErrorImplCopyWith<$Res>
    implements $AppErrorCopyWith<$Res> {
  factory _$$InvalidDataErrorImplCopyWith(_$InvalidDataErrorImpl value,
          $Res Function(_$InvalidDataErrorImpl) then) =
      __$$InvalidDataErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? message});
}

/// @nodoc
class __$$InvalidDataErrorImplCopyWithImpl<$Res>
    extends _$AppErrorCopyWithImpl<$Res, _$InvalidDataErrorImpl>
    implements _$$InvalidDataErrorImplCopyWith<$Res> {
  __$$InvalidDataErrorImplCopyWithImpl(_$InvalidDataErrorImpl _value,
      $Res Function(_$InvalidDataErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppError
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$InvalidDataErrorImpl(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$InvalidDataErrorImpl extends InvalidDataError {
  const _$InvalidDataErrorImpl({this.message = 'データの形式が正しくありません'}) : super._();

  @override
  @JsonKey()
  final String? message;

  @override
  String toString() {
    return 'AppError.invalidData(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InvalidDataErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of AppError
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InvalidDataErrorImplCopyWith<_$InvalidDataErrorImpl> get copyWith =>
      __$$InvalidDataErrorImplCopyWithImpl<_$InvalidDataErrorImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? message) network,
    required TResult Function(int? statusCode, String? message) api,
    required TResult Function(String? message) unauthorized,
    required TResult Function(String? message) unknown,
    required TResult Function(String? message) invalidData,
    required TResult Function(String? message) cache,
  }) {
    return invalidData(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? message)? network,
    TResult? Function(int? statusCode, String? message)? api,
    TResult? Function(String? message)? unauthorized,
    TResult? Function(String? message)? unknown,
    TResult? Function(String? message)? invalidData,
    TResult? Function(String? message)? cache,
  }) {
    return invalidData?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message)? network,
    TResult Function(int? statusCode, String? message)? api,
    TResult Function(String? message)? unauthorized,
    TResult Function(String? message)? unknown,
    TResult Function(String? message)? invalidData,
    TResult Function(String? message)? cache,
    required TResult orElse(),
  }) {
    if (invalidData != null) {
      return invalidData(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NetworkError value) network,
    required TResult Function(ApiError value) api,
    required TResult Function(UnauthorizedError value) unauthorized,
    required TResult Function(UnknownError value) unknown,
    required TResult Function(InvalidDataError value) invalidData,
    required TResult Function(CacheError value) cache,
  }) {
    return invalidData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NetworkError value)? network,
    TResult? Function(ApiError value)? api,
    TResult? Function(UnauthorizedError value)? unauthorized,
    TResult? Function(UnknownError value)? unknown,
    TResult? Function(InvalidDataError value)? invalidData,
    TResult? Function(CacheError value)? cache,
  }) {
    return invalidData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NetworkError value)? network,
    TResult Function(ApiError value)? api,
    TResult Function(UnauthorizedError value)? unauthorized,
    TResult Function(UnknownError value)? unknown,
    TResult Function(InvalidDataError value)? invalidData,
    TResult Function(CacheError value)? cache,
    required TResult orElse(),
  }) {
    if (invalidData != null) {
      return invalidData(this);
    }
    return orElse();
  }
}

abstract class InvalidDataError extends AppError {
  const factory InvalidDataError({final String? message}) =
      _$InvalidDataErrorImpl;
  const InvalidDataError._() : super._();

  @override
  String? get message;

  /// Create a copy of AppError
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InvalidDataErrorImplCopyWith<_$InvalidDataErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CacheErrorImplCopyWith<$Res>
    implements $AppErrorCopyWith<$Res> {
  factory _$$CacheErrorImplCopyWith(
          _$CacheErrorImpl value, $Res Function(_$CacheErrorImpl) then) =
      __$$CacheErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? message});
}

/// @nodoc
class __$$CacheErrorImplCopyWithImpl<$Res>
    extends _$AppErrorCopyWithImpl<$Res, _$CacheErrorImpl>
    implements _$$CacheErrorImplCopyWith<$Res> {
  __$$CacheErrorImplCopyWithImpl(
      _$CacheErrorImpl _value, $Res Function(_$CacheErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppError
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$CacheErrorImpl(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$CacheErrorImpl extends CacheError {
  const _$CacheErrorImpl({this.message = 'キャッシュエラーが発生しました'}) : super._();

  @override
  @JsonKey()
  final String? message;

  @override
  String toString() {
    return 'AppError.cache(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CacheErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of AppError
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CacheErrorImplCopyWith<_$CacheErrorImpl> get copyWith =>
      __$$CacheErrorImplCopyWithImpl<_$CacheErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? message) network,
    required TResult Function(int? statusCode, String? message) api,
    required TResult Function(String? message) unauthorized,
    required TResult Function(String? message) unknown,
    required TResult Function(String? message) invalidData,
    required TResult Function(String? message) cache,
  }) {
    return cache(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? message)? network,
    TResult? Function(int? statusCode, String? message)? api,
    TResult? Function(String? message)? unauthorized,
    TResult? Function(String? message)? unknown,
    TResult? Function(String? message)? invalidData,
    TResult? Function(String? message)? cache,
  }) {
    return cache?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message)? network,
    TResult Function(int? statusCode, String? message)? api,
    TResult Function(String? message)? unauthorized,
    TResult Function(String? message)? unknown,
    TResult Function(String? message)? invalidData,
    TResult Function(String? message)? cache,
    required TResult orElse(),
  }) {
    if (cache != null) {
      return cache(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NetworkError value) network,
    required TResult Function(ApiError value) api,
    required TResult Function(UnauthorizedError value) unauthorized,
    required TResult Function(UnknownError value) unknown,
    required TResult Function(InvalidDataError value) invalidData,
    required TResult Function(CacheError value) cache,
  }) {
    return cache(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NetworkError value)? network,
    TResult? Function(ApiError value)? api,
    TResult? Function(UnauthorizedError value)? unauthorized,
    TResult? Function(UnknownError value)? unknown,
    TResult? Function(InvalidDataError value)? invalidData,
    TResult? Function(CacheError value)? cache,
  }) {
    return cache?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NetworkError value)? network,
    TResult Function(ApiError value)? api,
    TResult Function(UnauthorizedError value)? unauthorized,
    TResult Function(UnknownError value)? unknown,
    TResult Function(InvalidDataError value)? invalidData,
    TResult Function(CacheError value)? cache,
    required TResult orElse(),
  }) {
    if (cache != null) {
      return cache(this);
    }
    return orElse();
  }
}

abstract class CacheError extends AppError {
  const factory CacheError({final String? message}) = _$CacheErrorImpl;
  const CacheError._() : super._();

  @override
  String? get message;

  /// Create a copy of AppError
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CacheErrorImplCopyWith<_$CacheErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
