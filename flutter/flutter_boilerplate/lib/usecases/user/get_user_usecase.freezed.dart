// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_user_usecase.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$GetUserParams {
  String get userId => throw _privateConstructorUsedError;
  bool get forceRefresh => throw _privateConstructorUsedError;

  /// Create a copy of GetUserParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GetUserParamsCopyWith<GetUserParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetUserParamsCopyWith<$Res> {
  factory $GetUserParamsCopyWith(
          GetUserParams value, $Res Function(GetUserParams) then) =
      _$GetUserParamsCopyWithImpl<$Res, GetUserParams>;
  @useResult
  $Res call({String userId, bool forceRefresh});
}

/// @nodoc
class _$GetUserParamsCopyWithImpl<$Res, $Val extends GetUserParams>
    implements $GetUserParamsCopyWith<$Res> {
  _$GetUserParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GetUserParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? forceRefresh = null,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      forceRefresh: null == forceRefresh
          ? _value.forceRefresh
          : forceRefresh // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetUserParamsImplCopyWith<$Res>
    implements $GetUserParamsCopyWith<$Res> {
  factory _$$GetUserParamsImplCopyWith(
          _$GetUserParamsImpl value, $Res Function(_$GetUserParamsImpl) then) =
      __$$GetUserParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String userId, bool forceRefresh});
}

/// @nodoc
class __$$GetUserParamsImplCopyWithImpl<$Res>
    extends _$GetUserParamsCopyWithImpl<$Res, _$GetUserParamsImpl>
    implements _$$GetUserParamsImplCopyWith<$Res> {
  __$$GetUserParamsImplCopyWithImpl(
      _$GetUserParamsImpl _value, $Res Function(_$GetUserParamsImpl) _then)
      : super(_value, _then);

  /// Create a copy of GetUserParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? forceRefresh = null,
  }) {
    return _then(_$GetUserParamsImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      forceRefresh: null == forceRefresh
          ? _value.forceRefresh
          : forceRefresh // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$GetUserParamsImpl implements _GetUserParams {
  const _$GetUserParamsImpl({required this.userId, this.forceRefresh = false});

  @override
  final String userId;
  @override
  @JsonKey()
  final bool forceRefresh;

  @override
  String toString() {
    return 'GetUserParams(userId: $userId, forceRefresh: $forceRefresh)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetUserParamsImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.forceRefresh, forceRefresh) ||
                other.forceRefresh == forceRefresh));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userId, forceRefresh);

  /// Create a copy of GetUserParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetUserParamsImplCopyWith<_$GetUserParamsImpl> get copyWith =>
      __$$GetUserParamsImplCopyWithImpl<_$GetUserParamsImpl>(this, _$identity);
}

abstract class _GetUserParams implements GetUserParams {
  const factory _GetUserParams(
      {required final String userId,
      final bool forceRefresh}) = _$GetUserParamsImpl;

  @override
  String get userId;
  @override
  bool get forceRefresh;

  /// Create a copy of GetUserParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetUserParamsImplCopyWith<_$GetUserParamsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
