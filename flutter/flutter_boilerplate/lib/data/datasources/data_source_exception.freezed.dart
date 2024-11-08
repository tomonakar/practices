// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'data_source_exception.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DataSourceException {
  String? get message => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? message) network,
    required TResult Function(String? message) notFound,
    required TResult Function(String? message) unauthorized,
    required TResult Function(String? message) badRequest,
    required TResult Function(String? message) server,
    required TResult Function(String? message) cache,
    required TResult Function(String? message) parse,
    required TResult Function(String? message) unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? message)? network,
    TResult? Function(String? message)? notFound,
    TResult? Function(String? message)? unauthorized,
    TResult? Function(String? message)? badRequest,
    TResult? Function(String? message)? server,
    TResult? Function(String? message)? cache,
    TResult? Function(String? message)? parse,
    TResult? Function(String? message)? unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message)? network,
    TResult Function(String? message)? notFound,
    TResult Function(String? message)? unauthorized,
    TResult Function(String? message)? badRequest,
    TResult Function(String? message)? server,
    TResult Function(String? message)? cache,
    TResult Function(String? message)? parse,
    TResult Function(String? message)? unknown,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NetworkException value) network,
    required TResult Function(NotFoundException value) notFound,
    required TResult Function(UnauthorizedException value) unauthorized,
    required TResult Function(BadRequestException value) badRequest,
    required TResult Function(ServerException value) server,
    required TResult Function(CacheException value) cache,
    required TResult Function(ParseException value) parse,
    required TResult Function(UnknownException value) unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NetworkException value)? network,
    TResult? Function(NotFoundException value)? notFound,
    TResult? Function(UnauthorizedException value)? unauthorized,
    TResult? Function(BadRequestException value)? badRequest,
    TResult? Function(ServerException value)? server,
    TResult? Function(CacheException value)? cache,
    TResult? Function(ParseException value)? parse,
    TResult? Function(UnknownException value)? unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NetworkException value)? network,
    TResult Function(NotFoundException value)? notFound,
    TResult Function(UnauthorizedException value)? unauthorized,
    TResult Function(BadRequestException value)? badRequest,
    TResult Function(ServerException value)? server,
    TResult Function(CacheException value)? cache,
    TResult Function(ParseException value)? parse,
    TResult Function(UnknownException value)? unknown,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of DataSourceException
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DataSourceExceptionCopyWith<DataSourceException> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataSourceExceptionCopyWith<$Res> {
  factory $DataSourceExceptionCopyWith(
          DataSourceException value, $Res Function(DataSourceException) then) =
      _$DataSourceExceptionCopyWithImpl<$Res, DataSourceException>;
  @useResult
  $Res call({String? message});
}

/// @nodoc
class _$DataSourceExceptionCopyWithImpl<$Res, $Val extends DataSourceException>
    implements $DataSourceExceptionCopyWith<$Res> {
  _$DataSourceExceptionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DataSourceException
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
abstract class _$$NetworkExceptionImplCopyWith<$Res>
    implements $DataSourceExceptionCopyWith<$Res> {
  factory _$$NetworkExceptionImplCopyWith(_$NetworkExceptionImpl value,
          $Res Function(_$NetworkExceptionImpl) then) =
      __$$NetworkExceptionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? message});
}

/// @nodoc
class __$$NetworkExceptionImplCopyWithImpl<$Res>
    extends _$DataSourceExceptionCopyWithImpl<$Res, _$NetworkExceptionImpl>
    implements _$$NetworkExceptionImplCopyWith<$Res> {
  __$$NetworkExceptionImplCopyWithImpl(_$NetworkExceptionImpl _value,
      $Res Function(_$NetworkExceptionImpl) _then)
      : super(_value, _then);

  /// Create a copy of DataSourceException
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$NetworkExceptionImpl(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$NetworkExceptionImpl extends NetworkException {
  const _$NetworkExceptionImpl({this.message = 'ネットワークエラーが発生しました'}) : super._();

  @override
  @JsonKey()
  final String? message;

  @override
  String toString() {
    return 'DataSourceException.network(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NetworkExceptionImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of DataSourceException
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NetworkExceptionImplCopyWith<_$NetworkExceptionImpl> get copyWith =>
      __$$NetworkExceptionImplCopyWithImpl<_$NetworkExceptionImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? message) network,
    required TResult Function(String? message) notFound,
    required TResult Function(String? message) unauthorized,
    required TResult Function(String? message) badRequest,
    required TResult Function(String? message) server,
    required TResult Function(String? message) cache,
    required TResult Function(String? message) parse,
    required TResult Function(String? message) unknown,
  }) {
    return network(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? message)? network,
    TResult? Function(String? message)? notFound,
    TResult? Function(String? message)? unauthorized,
    TResult? Function(String? message)? badRequest,
    TResult? Function(String? message)? server,
    TResult? Function(String? message)? cache,
    TResult? Function(String? message)? parse,
    TResult? Function(String? message)? unknown,
  }) {
    return network?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message)? network,
    TResult Function(String? message)? notFound,
    TResult Function(String? message)? unauthorized,
    TResult Function(String? message)? badRequest,
    TResult Function(String? message)? server,
    TResult Function(String? message)? cache,
    TResult Function(String? message)? parse,
    TResult Function(String? message)? unknown,
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
    required TResult Function(NetworkException value) network,
    required TResult Function(NotFoundException value) notFound,
    required TResult Function(UnauthorizedException value) unauthorized,
    required TResult Function(BadRequestException value) badRequest,
    required TResult Function(ServerException value) server,
    required TResult Function(CacheException value) cache,
    required TResult Function(ParseException value) parse,
    required TResult Function(UnknownException value) unknown,
  }) {
    return network(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NetworkException value)? network,
    TResult? Function(NotFoundException value)? notFound,
    TResult? Function(UnauthorizedException value)? unauthorized,
    TResult? Function(BadRequestException value)? badRequest,
    TResult? Function(ServerException value)? server,
    TResult? Function(CacheException value)? cache,
    TResult? Function(ParseException value)? parse,
    TResult? Function(UnknownException value)? unknown,
  }) {
    return network?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NetworkException value)? network,
    TResult Function(NotFoundException value)? notFound,
    TResult Function(UnauthorizedException value)? unauthorized,
    TResult Function(BadRequestException value)? badRequest,
    TResult Function(ServerException value)? server,
    TResult Function(CacheException value)? cache,
    TResult Function(ParseException value)? parse,
    TResult Function(UnknownException value)? unknown,
    required TResult orElse(),
  }) {
    if (network != null) {
      return network(this);
    }
    return orElse();
  }
}

abstract class NetworkException extends DataSourceException {
  const factory NetworkException({final String? message}) =
      _$NetworkExceptionImpl;
  const NetworkException._() : super._();

  @override
  String? get message;

  /// Create a copy of DataSourceException
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NetworkExceptionImplCopyWith<_$NetworkExceptionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NotFoundExceptionImplCopyWith<$Res>
    implements $DataSourceExceptionCopyWith<$Res> {
  factory _$$NotFoundExceptionImplCopyWith(_$NotFoundExceptionImpl value,
          $Res Function(_$NotFoundExceptionImpl) then) =
      __$$NotFoundExceptionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? message});
}

/// @nodoc
class __$$NotFoundExceptionImplCopyWithImpl<$Res>
    extends _$DataSourceExceptionCopyWithImpl<$Res, _$NotFoundExceptionImpl>
    implements _$$NotFoundExceptionImplCopyWith<$Res> {
  __$$NotFoundExceptionImplCopyWithImpl(_$NotFoundExceptionImpl _value,
      $Res Function(_$NotFoundExceptionImpl) _then)
      : super(_value, _then);

  /// Create a copy of DataSourceException
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$NotFoundExceptionImpl(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$NotFoundExceptionImpl extends NotFoundException {
  const _$NotFoundExceptionImpl({this.message = 'リソースが見つかりません'}) : super._();

  @override
  @JsonKey()
  final String? message;

  @override
  String toString() {
    return 'DataSourceException.notFound(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotFoundExceptionImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of DataSourceException
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NotFoundExceptionImplCopyWith<_$NotFoundExceptionImpl> get copyWith =>
      __$$NotFoundExceptionImplCopyWithImpl<_$NotFoundExceptionImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? message) network,
    required TResult Function(String? message) notFound,
    required TResult Function(String? message) unauthorized,
    required TResult Function(String? message) badRequest,
    required TResult Function(String? message) server,
    required TResult Function(String? message) cache,
    required TResult Function(String? message) parse,
    required TResult Function(String? message) unknown,
  }) {
    return notFound(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? message)? network,
    TResult? Function(String? message)? notFound,
    TResult? Function(String? message)? unauthorized,
    TResult? Function(String? message)? badRequest,
    TResult? Function(String? message)? server,
    TResult? Function(String? message)? cache,
    TResult? Function(String? message)? parse,
    TResult? Function(String? message)? unknown,
  }) {
    return notFound?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message)? network,
    TResult Function(String? message)? notFound,
    TResult Function(String? message)? unauthorized,
    TResult Function(String? message)? badRequest,
    TResult Function(String? message)? server,
    TResult Function(String? message)? cache,
    TResult Function(String? message)? parse,
    TResult Function(String? message)? unknown,
    required TResult orElse(),
  }) {
    if (notFound != null) {
      return notFound(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NetworkException value) network,
    required TResult Function(NotFoundException value) notFound,
    required TResult Function(UnauthorizedException value) unauthorized,
    required TResult Function(BadRequestException value) badRequest,
    required TResult Function(ServerException value) server,
    required TResult Function(CacheException value) cache,
    required TResult Function(ParseException value) parse,
    required TResult Function(UnknownException value) unknown,
  }) {
    return notFound(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NetworkException value)? network,
    TResult? Function(NotFoundException value)? notFound,
    TResult? Function(UnauthorizedException value)? unauthorized,
    TResult? Function(BadRequestException value)? badRequest,
    TResult? Function(ServerException value)? server,
    TResult? Function(CacheException value)? cache,
    TResult? Function(ParseException value)? parse,
    TResult? Function(UnknownException value)? unknown,
  }) {
    return notFound?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NetworkException value)? network,
    TResult Function(NotFoundException value)? notFound,
    TResult Function(UnauthorizedException value)? unauthorized,
    TResult Function(BadRequestException value)? badRequest,
    TResult Function(ServerException value)? server,
    TResult Function(CacheException value)? cache,
    TResult Function(ParseException value)? parse,
    TResult Function(UnknownException value)? unknown,
    required TResult orElse(),
  }) {
    if (notFound != null) {
      return notFound(this);
    }
    return orElse();
  }
}

abstract class NotFoundException extends DataSourceException {
  const factory NotFoundException({final String? message}) =
      _$NotFoundExceptionImpl;
  const NotFoundException._() : super._();

  @override
  String? get message;

  /// Create a copy of DataSourceException
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NotFoundExceptionImplCopyWith<_$NotFoundExceptionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UnauthorizedExceptionImplCopyWith<$Res>
    implements $DataSourceExceptionCopyWith<$Res> {
  factory _$$UnauthorizedExceptionImplCopyWith(
          _$UnauthorizedExceptionImpl value,
          $Res Function(_$UnauthorizedExceptionImpl) then) =
      __$$UnauthorizedExceptionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? message});
}

/// @nodoc
class __$$UnauthorizedExceptionImplCopyWithImpl<$Res>
    extends _$DataSourceExceptionCopyWithImpl<$Res, _$UnauthorizedExceptionImpl>
    implements _$$UnauthorizedExceptionImplCopyWith<$Res> {
  __$$UnauthorizedExceptionImplCopyWithImpl(_$UnauthorizedExceptionImpl _value,
      $Res Function(_$UnauthorizedExceptionImpl) _then)
      : super(_value, _then);

  /// Create a copy of DataSourceException
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$UnauthorizedExceptionImpl(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$UnauthorizedExceptionImpl extends UnauthorizedException {
  const _$UnauthorizedExceptionImpl({this.message = '認証エラーが発生しました'})
      : super._();

  @override
  @JsonKey()
  final String? message;

  @override
  String toString() {
    return 'DataSourceException.unauthorized(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UnauthorizedExceptionImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of DataSourceException
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UnauthorizedExceptionImplCopyWith<_$UnauthorizedExceptionImpl>
      get copyWith => __$$UnauthorizedExceptionImplCopyWithImpl<
          _$UnauthorizedExceptionImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? message) network,
    required TResult Function(String? message) notFound,
    required TResult Function(String? message) unauthorized,
    required TResult Function(String? message) badRequest,
    required TResult Function(String? message) server,
    required TResult Function(String? message) cache,
    required TResult Function(String? message) parse,
    required TResult Function(String? message) unknown,
  }) {
    return unauthorized(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? message)? network,
    TResult? Function(String? message)? notFound,
    TResult? Function(String? message)? unauthorized,
    TResult? Function(String? message)? badRequest,
    TResult? Function(String? message)? server,
    TResult? Function(String? message)? cache,
    TResult? Function(String? message)? parse,
    TResult? Function(String? message)? unknown,
  }) {
    return unauthorized?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message)? network,
    TResult Function(String? message)? notFound,
    TResult Function(String? message)? unauthorized,
    TResult Function(String? message)? badRequest,
    TResult Function(String? message)? server,
    TResult Function(String? message)? cache,
    TResult Function(String? message)? parse,
    TResult Function(String? message)? unknown,
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
    required TResult Function(NetworkException value) network,
    required TResult Function(NotFoundException value) notFound,
    required TResult Function(UnauthorizedException value) unauthorized,
    required TResult Function(BadRequestException value) badRequest,
    required TResult Function(ServerException value) server,
    required TResult Function(CacheException value) cache,
    required TResult Function(ParseException value) parse,
    required TResult Function(UnknownException value) unknown,
  }) {
    return unauthorized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NetworkException value)? network,
    TResult? Function(NotFoundException value)? notFound,
    TResult? Function(UnauthorizedException value)? unauthorized,
    TResult? Function(BadRequestException value)? badRequest,
    TResult? Function(ServerException value)? server,
    TResult? Function(CacheException value)? cache,
    TResult? Function(ParseException value)? parse,
    TResult? Function(UnknownException value)? unknown,
  }) {
    return unauthorized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NetworkException value)? network,
    TResult Function(NotFoundException value)? notFound,
    TResult Function(UnauthorizedException value)? unauthorized,
    TResult Function(BadRequestException value)? badRequest,
    TResult Function(ServerException value)? server,
    TResult Function(CacheException value)? cache,
    TResult Function(ParseException value)? parse,
    TResult Function(UnknownException value)? unknown,
    required TResult orElse(),
  }) {
    if (unauthorized != null) {
      return unauthorized(this);
    }
    return orElse();
  }
}

abstract class UnauthorizedException extends DataSourceException {
  const factory UnauthorizedException({final String? message}) =
      _$UnauthorizedExceptionImpl;
  const UnauthorizedException._() : super._();

  @override
  String? get message;

  /// Create a copy of DataSourceException
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UnauthorizedExceptionImplCopyWith<_$UnauthorizedExceptionImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$BadRequestExceptionImplCopyWith<$Res>
    implements $DataSourceExceptionCopyWith<$Res> {
  factory _$$BadRequestExceptionImplCopyWith(_$BadRequestExceptionImpl value,
          $Res Function(_$BadRequestExceptionImpl) then) =
      __$$BadRequestExceptionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? message});
}

/// @nodoc
class __$$BadRequestExceptionImplCopyWithImpl<$Res>
    extends _$DataSourceExceptionCopyWithImpl<$Res, _$BadRequestExceptionImpl>
    implements _$$BadRequestExceptionImplCopyWith<$Res> {
  __$$BadRequestExceptionImplCopyWithImpl(_$BadRequestExceptionImpl _value,
      $Res Function(_$BadRequestExceptionImpl) _then)
      : super(_value, _then);

  /// Create a copy of DataSourceException
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$BadRequestExceptionImpl(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$BadRequestExceptionImpl extends BadRequestException {
  const _$BadRequestExceptionImpl({this.message = 'リクエストが不正です'}) : super._();

  @override
  @JsonKey()
  final String? message;

  @override
  String toString() {
    return 'DataSourceException.badRequest(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BadRequestExceptionImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of DataSourceException
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BadRequestExceptionImplCopyWith<_$BadRequestExceptionImpl> get copyWith =>
      __$$BadRequestExceptionImplCopyWithImpl<_$BadRequestExceptionImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? message) network,
    required TResult Function(String? message) notFound,
    required TResult Function(String? message) unauthorized,
    required TResult Function(String? message) badRequest,
    required TResult Function(String? message) server,
    required TResult Function(String? message) cache,
    required TResult Function(String? message) parse,
    required TResult Function(String? message) unknown,
  }) {
    return badRequest(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? message)? network,
    TResult? Function(String? message)? notFound,
    TResult? Function(String? message)? unauthorized,
    TResult? Function(String? message)? badRequest,
    TResult? Function(String? message)? server,
    TResult? Function(String? message)? cache,
    TResult? Function(String? message)? parse,
    TResult? Function(String? message)? unknown,
  }) {
    return badRequest?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message)? network,
    TResult Function(String? message)? notFound,
    TResult Function(String? message)? unauthorized,
    TResult Function(String? message)? badRequest,
    TResult Function(String? message)? server,
    TResult Function(String? message)? cache,
    TResult Function(String? message)? parse,
    TResult Function(String? message)? unknown,
    required TResult orElse(),
  }) {
    if (badRequest != null) {
      return badRequest(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NetworkException value) network,
    required TResult Function(NotFoundException value) notFound,
    required TResult Function(UnauthorizedException value) unauthorized,
    required TResult Function(BadRequestException value) badRequest,
    required TResult Function(ServerException value) server,
    required TResult Function(CacheException value) cache,
    required TResult Function(ParseException value) parse,
    required TResult Function(UnknownException value) unknown,
  }) {
    return badRequest(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NetworkException value)? network,
    TResult? Function(NotFoundException value)? notFound,
    TResult? Function(UnauthorizedException value)? unauthorized,
    TResult? Function(BadRequestException value)? badRequest,
    TResult? Function(ServerException value)? server,
    TResult? Function(CacheException value)? cache,
    TResult? Function(ParseException value)? parse,
    TResult? Function(UnknownException value)? unknown,
  }) {
    return badRequest?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NetworkException value)? network,
    TResult Function(NotFoundException value)? notFound,
    TResult Function(UnauthorizedException value)? unauthorized,
    TResult Function(BadRequestException value)? badRequest,
    TResult Function(ServerException value)? server,
    TResult Function(CacheException value)? cache,
    TResult Function(ParseException value)? parse,
    TResult Function(UnknownException value)? unknown,
    required TResult orElse(),
  }) {
    if (badRequest != null) {
      return badRequest(this);
    }
    return orElse();
  }
}

abstract class BadRequestException extends DataSourceException {
  const factory BadRequestException({final String? message}) =
      _$BadRequestExceptionImpl;
  const BadRequestException._() : super._();

  @override
  String? get message;

  /// Create a copy of DataSourceException
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BadRequestExceptionImplCopyWith<_$BadRequestExceptionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ServerExceptionImplCopyWith<$Res>
    implements $DataSourceExceptionCopyWith<$Res> {
  factory _$$ServerExceptionImplCopyWith(_$ServerExceptionImpl value,
          $Res Function(_$ServerExceptionImpl) then) =
      __$$ServerExceptionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? message});
}

/// @nodoc
class __$$ServerExceptionImplCopyWithImpl<$Res>
    extends _$DataSourceExceptionCopyWithImpl<$Res, _$ServerExceptionImpl>
    implements _$$ServerExceptionImplCopyWith<$Res> {
  __$$ServerExceptionImplCopyWithImpl(
      _$ServerExceptionImpl _value, $Res Function(_$ServerExceptionImpl) _then)
      : super(_value, _then);

  /// Create a copy of DataSourceException
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$ServerExceptionImpl(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$ServerExceptionImpl extends ServerException {
  const _$ServerExceptionImpl({this.message = 'サーバーエラーが発生しました'}) : super._();

  @override
  @JsonKey()
  final String? message;

  @override
  String toString() {
    return 'DataSourceException.server(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServerExceptionImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of DataSourceException
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ServerExceptionImplCopyWith<_$ServerExceptionImpl> get copyWith =>
      __$$ServerExceptionImplCopyWithImpl<_$ServerExceptionImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? message) network,
    required TResult Function(String? message) notFound,
    required TResult Function(String? message) unauthorized,
    required TResult Function(String? message) badRequest,
    required TResult Function(String? message) server,
    required TResult Function(String? message) cache,
    required TResult Function(String? message) parse,
    required TResult Function(String? message) unknown,
  }) {
    return server(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? message)? network,
    TResult? Function(String? message)? notFound,
    TResult? Function(String? message)? unauthorized,
    TResult? Function(String? message)? badRequest,
    TResult? Function(String? message)? server,
    TResult? Function(String? message)? cache,
    TResult? Function(String? message)? parse,
    TResult? Function(String? message)? unknown,
  }) {
    return server?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message)? network,
    TResult Function(String? message)? notFound,
    TResult Function(String? message)? unauthorized,
    TResult Function(String? message)? badRequest,
    TResult Function(String? message)? server,
    TResult Function(String? message)? cache,
    TResult Function(String? message)? parse,
    TResult Function(String? message)? unknown,
    required TResult orElse(),
  }) {
    if (server != null) {
      return server(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NetworkException value) network,
    required TResult Function(NotFoundException value) notFound,
    required TResult Function(UnauthorizedException value) unauthorized,
    required TResult Function(BadRequestException value) badRequest,
    required TResult Function(ServerException value) server,
    required TResult Function(CacheException value) cache,
    required TResult Function(ParseException value) parse,
    required TResult Function(UnknownException value) unknown,
  }) {
    return server(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NetworkException value)? network,
    TResult? Function(NotFoundException value)? notFound,
    TResult? Function(UnauthorizedException value)? unauthorized,
    TResult? Function(BadRequestException value)? badRequest,
    TResult? Function(ServerException value)? server,
    TResult? Function(CacheException value)? cache,
    TResult? Function(ParseException value)? parse,
    TResult? Function(UnknownException value)? unknown,
  }) {
    return server?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NetworkException value)? network,
    TResult Function(NotFoundException value)? notFound,
    TResult Function(UnauthorizedException value)? unauthorized,
    TResult Function(BadRequestException value)? badRequest,
    TResult Function(ServerException value)? server,
    TResult Function(CacheException value)? cache,
    TResult Function(ParseException value)? parse,
    TResult Function(UnknownException value)? unknown,
    required TResult orElse(),
  }) {
    if (server != null) {
      return server(this);
    }
    return orElse();
  }
}

abstract class ServerException extends DataSourceException {
  const factory ServerException({final String? message}) =
      _$ServerExceptionImpl;
  const ServerException._() : super._();

  @override
  String? get message;

  /// Create a copy of DataSourceException
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ServerExceptionImplCopyWith<_$ServerExceptionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CacheExceptionImplCopyWith<$Res>
    implements $DataSourceExceptionCopyWith<$Res> {
  factory _$$CacheExceptionImplCopyWith(_$CacheExceptionImpl value,
          $Res Function(_$CacheExceptionImpl) then) =
      __$$CacheExceptionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? message});
}

/// @nodoc
class __$$CacheExceptionImplCopyWithImpl<$Res>
    extends _$DataSourceExceptionCopyWithImpl<$Res, _$CacheExceptionImpl>
    implements _$$CacheExceptionImplCopyWith<$Res> {
  __$$CacheExceptionImplCopyWithImpl(
      _$CacheExceptionImpl _value, $Res Function(_$CacheExceptionImpl) _then)
      : super(_value, _then);

  /// Create a copy of DataSourceException
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$CacheExceptionImpl(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$CacheExceptionImpl extends CacheException {
  const _$CacheExceptionImpl({this.message = 'キャッシュエラーが発生しました'}) : super._();

  @override
  @JsonKey()
  final String? message;

  @override
  String toString() {
    return 'DataSourceException.cache(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CacheExceptionImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of DataSourceException
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CacheExceptionImplCopyWith<_$CacheExceptionImpl> get copyWith =>
      __$$CacheExceptionImplCopyWithImpl<_$CacheExceptionImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? message) network,
    required TResult Function(String? message) notFound,
    required TResult Function(String? message) unauthorized,
    required TResult Function(String? message) badRequest,
    required TResult Function(String? message) server,
    required TResult Function(String? message) cache,
    required TResult Function(String? message) parse,
    required TResult Function(String? message) unknown,
  }) {
    return cache(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? message)? network,
    TResult? Function(String? message)? notFound,
    TResult? Function(String? message)? unauthorized,
    TResult? Function(String? message)? badRequest,
    TResult? Function(String? message)? server,
    TResult? Function(String? message)? cache,
    TResult? Function(String? message)? parse,
    TResult? Function(String? message)? unknown,
  }) {
    return cache?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message)? network,
    TResult Function(String? message)? notFound,
    TResult Function(String? message)? unauthorized,
    TResult Function(String? message)? badRequest,
    TResult Function(String? message)? server,
    TResult Function(String? message)? cache,
    TResult Function(String? message)? parse,
    TResult Function(String? message)? unknown,
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
    required TResult Function(NetworkException value) network,
    required TResult Function(NotFoundException value) notFound,
    required TResult Function(UnauthorizedException value) unauthorized,
    required TResult Function(BadRequestException value) badRequest,
    required TResult Function(ServerException value) server,
    required TResult Function(CacheException value) cache,
    required TResult Function(ParseException value) parse,
    required TResult Function(UnknownException value) unknown,
  }) {
    return cache(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NetworkException value)? network,
    TResult? Function(NotFoundException value)? notFound,
    TResult? Function(UnauthorizedException value)? unauthorized,
    TResult? Function(BadRequestException value)? badRequest,
    TResult? Function(ServerException value)? server,
    TResult? Function(CacheException value)? cache,
    TResult? Function(ParseException value)? parse,
    TResult? Function(UnknownException value)? unknown,
  }) {
    return cache?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NetworkException value)? network,
    TResult Function(NotFoundException value)? notFound,
    TResult Function(UnauthorizedException value)? unauthorized,
    TResult Function(BadRequestException value)? badRequest,
    TResult Function(ServerException value)? server,
    TResult Function(CacheException value)? cache,
    TResult Function(ParseException value)? parse,
    TResult Function(UnknownException value)? unknown,
    required TResult orElse(),
  }) {
    if (cache != null) {
      return cache(this);
    }
    return orElse();
  }
}

abstract class CacheException extends DataSourceException {
  const factory CacheException({final String? message}) = _$CacheExceptionImpl;
  const CacheException._() : super._();

  @override
  String? get message;

  /// Create a copy of DataSourceException
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CacheExceptionImplCopyWith<_$CacheExceptionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ParseExceptionImplCopyWith<$Res>
    implements $DataSourceExceptionCopyWith<$Res> {
  factory _$$ParseExceptionImplCopyWith(_$ParseExceptionImpl value,
          $Res Function(_$ParseExceptionImpl) then) =
      __$$ParseExceptionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? message});
}

/// @nodoc
class __$$ParseExceptionImplCopyWithImpl<$Res>
    extends _$DataSourceExceptionCopyWithImpl<$Res, _$ParseExceptionImpl>
    implements _$$ParseExceptionImplCopyWith<$Res> {
  __$$ParseExceptionImplCopyWithImpl(
      _$ParseExceptionImpl _value, $Res Function(_$ParseExceptionImpl) _then)
      : super(_value, _then);

  /// Create a copy of DataSourceException
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$ParseExceptionImpl(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$ParseExceptionImpl extends ParseException {
  const _$ParseExceptionImpl({this.message = 'データの解析に失敗しました'}) : super._();

  @override
  @JsonKey()
  final String? message;

  @override
  String toString() {
    return 'DataSourceException.parse(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ParseExceptionImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of DataSourceException
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ParseExceptionImplCopyWith<_$ParseExceptionImpl> get copyWith =>
      __$$ParseExceptionImplCopyWithImpl<_$ParseExceptionImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? message) network,
    required TResult Function(String? message) notFound,
    required TResult Function(String? message) unauthorized,
    required TResult Function(String? message) badRequest,
    required TResult Function(String? message) server,
    required TResult Function(String? message) cache,
    required TResult Function(String? message) parse,
    required TResult Function(String? message) unknown,
  }) {
    return parse(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? message)? network,
    TResult? Function(String? message)? notFound,
    TResult? Function(String? message)? unauthorized,
    TResult? Function(String? message)? badRequest,
    TResult? Function(String? message)? server,
    TResult? Function(String? message)? cache,
    TResult? Function(String? message)? parse,
    TResult? Function(String? message)? unknown,
  }) {
    return parse?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message)? network,
    TResult Function(String? message)? notFound,
    TResult Function(String? message)? unauthorized,
    TResult Function(String? message)? badRequest,
    TResult Function(String? message)? server,
    TResult Function(String? message)? cache,
    TResult Function(String? message)? parse,
    TResult Function(String? message)? unknown,
    required TResult orElse(),
  }) {
    if (parse != null) {
      return parse(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NetworkException value) network,
    required TResult Function(NotFoundException value) notFound,
    required TResult Function(UnauthorizedException value) unauthorized,
    required TResult Function(BadRequestException value) badRequest,
    required TResult Function(ServerException value) server,
    required TResult Function(CacheException value) cache,
    required TResult Function(ParseException value) parse,
    required TResult Function(UnknownException value) unknown,
  }) {
    return parse(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NetworkException value)? network,
    TResult? Function(NotFoundException value)? notFound,
    TResult? Function(UnauthorizedException value)? unauthorized,
    TResult? Function(BadRequestException value)? badRequest,
    TResult? Function(ServerException value)? server,
    TResult? Function(CacheException value)? cache,
    TResult? Function(ParseException value)? parse,
    TResult? Function(UnknownException value)? unknown,
  }) {
    return parse?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NetworkException value)? network,
    TResult Function(NotFoundException value)? notFound,
    TResult Function(UnauthorizedException value)? unauthorized,
    TResult Function(BadRequestException value)? badRequest,
    TResult Function(ServerException value)? server,
    TResult Function(CacheException value)? cache,
    TResult Function(ParseException value)? parse,
    TResult Function(UnknownException value)? unknown,
    required TResult orElse(),
  }) {
    if (parse != null) {
      return parse(this);
    }
    return orElse();
  }
}

abstract class ParseException extends DataSourceException {
  const factory ParseException({final String? message}) = _$ParseExceptionImpl;
  const ParseException._() : super._();

  @override
  String? get message;

  /// Create a copy of DataSourceException
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ParseExceptionImplCopyWith<_$ParseExceptionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UnknownExceptionImplCopyWith<$Res>
    implements $DataSourceExceptionCopyWith<$Res> {
  factory _$$UnknownExceptionImplCopyWith(_$UnknownExceptionImpl value,
          $Res Function(_$UnknownExceptionImpl) then) =
      __$$UnknownExceptionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? message});
}

/// @nodoc
class __$$UnknownExceptionImplCopyWithImpl<$Res>
    extends _$DataSourceExceptionCopyWithImpl<$Res, _$UnknownExceptionImpl>
    implements _$$UnknownExceptionImplCopyWith<$Res> {
  __$$UnknownExceptionImplCopyWithImpl(_$UnknownExceptionImpl _value,
      $Res Function(_$UnknownExceptionImpl) _then)
      : super(_value, _then);

  /// Create a copy of DataSourceException
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$UnknownExceptionImpl(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$UnknownExceptionImpl extends UnknownException {
  const _$UnknownExceptionImpl({this.message = '予期せぬエラーが発生しました'}) : super._();

  @override
  @JsonKey()
  final String? message;

  @override
  String toString() {
    return 'DataSourceException.unknown(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UnknownExceptionImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of DataSourceException
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UnknownExceptionImplCopyWith<_$UnknownExceptionImpl> get copyWith =>
      __$$UnknownExceptionImplCopyWithImpl<_$UnknownExceptionImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? message) network,
    required TResult Function(String? message) notFound,
    required TResult Function(String? message) unauthorized,
    required TResult Function(String? message) badRequest,
    required TResult Function(String? message) server,
    required TResult Function(String? message) cache,
    required TResult Function(String? message) parse,
    required TResult Function(String? message) unknown,
  }) {
    return unknown(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? message)? network,
    TResult? Function(String? message)? notFound,
    TResult? Function(String? message)? unauthorized,
    TResult? Function(String? message)? badRequest,
    TResult? Function(String? message)? server,
    TResult? Function(String? message)? cache,
    TResult? Function(String? message)? parse,
    TResult? Function(String? message)? unknown,
  }) {
    return unknown?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message)? network,
    TResult Function(String? message)? notFound,
    TResult Function(String? message)? unauthorized,
    TResult Function(String? message)? badRequest,
    TResult Function(String? message)? server,
    TResult Function(String? message)? cache,
    TResult Function(String? message)? parse,
    TResult Function(String? message)? unknown,
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
    required TResult Function(NetworkException value) network,
    required TResult Function(NotFoundException value) notFound,
    required TResult Function(UnauthorizedException value) unauthorized,
    required TResult Function(BadRequestException value) badRequest,
    required TResult Function(ServerException value) server,
    required TResult Function(CacheException value) cache,
    required TResult Function(ParseException value) parse,
    required TResult Function(UnknownException value) unknown,
  }) {
    return unknown(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NetworkException value)? network,
    TResult? Function(NotFoundException value)? notFound,
    TResult? Function(UnauthorizedException value)? unauthorized,
    TResult? Function(BadRequestException value)? badRequest,
    TResult? Function(ServerException value)? server,
    TResult? Function(CacheException value)? cache,
    TResult? Function(ParseException value)? parse,
    TResult? Function(UnknownException value)? unknown,
  }) {
    return unknown?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NetworkException value)? network,
    TResult Function(NotFoundException value)? notFound,
    TResult Function(UnauthorizedException value)? unauthorized,
    TResult Function(BadRequestException value)? badRequest,
    TResult Function(ServerException value)? server,
    TResult Function(CacheException value)? cache,
    TResult Function(ParseException value)? parse,
    TResult Function(UnknownException value)? unknown,
    required TResult orElse(),
  }) {
    if (unknown != null) {
      return unknown(this);
    }
    return orElse();
  }
}

abstract class UnknownException extends DataSourceException {
  const factory UnknownException({final String? message}) =
      _$UnknownExceptionImpl;
  const UnknownException._() : super._();

  @override
  String? get message;

  /// Create a copy of DataSourceException
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UnknownExceptionImplCopyWith<_$UnknownExceptionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
