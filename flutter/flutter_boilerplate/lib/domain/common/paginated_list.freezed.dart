// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'paginated_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PaginatedList<T> {
  List<T> get items => throw _privateConstructorUsedError;
  int get total => throw _privateConstructorUsedError;
  int get currentPage => throw _privateConstructorUsedError;
  int get perPage => throw _privateConstructorUsedError;
  bool get hasMore => throw _privateConstructorUsedError;

  /// Create a copy of PaginatedList
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaginatedListCopyWith<T, PaginatedList<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaginatedListCopyWith<T, $Res> {
  factory $PaginatedListCopyWith(
          PaginatedList<T> value, $Res Function(PaginatedList<T>) then) =
      _$PaginatedListCopyWithImpl<T, $Res, PaginatedList<T>>;
  @useResult
  $Res call(
      {List<T> items, int total, int currentPage, int perPage, bool hasMore});
}

/// @nodoc
class _$PaginatedListCopyWithImpl<T, $Res, $Val extends PaginatedList<T>>
    implements $PaginatedListCopyWith<T, $Res> {
  _$PaginatedListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaginatedList
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? total = null,
    Object? currentPage = null,
    Object? perPage = null,
    Object? hasMore = null,
  }) {
    return _then(_value.copyWith(
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<T>,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      perPage: null == perPage
          ? _value.perPage
          : perPage // ignore: cast_nullable_to_non_nullable
              as int,
      hasMore: null == hasMore
          ? _value.hasMore
          : hasMore // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaginatedListImplCopyWith<T, $Res>
    implements $PaginatedListCopyWith<T, $Res> {
  factory _$$PaginatedListImplCopyWith(_$PaginatedListImpl<T> value,
          $Res Function(_$PaginatedListImpl<T>) then) =
      __$$PaginatedListImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call(
      {List<T> items, int total, int currentPage, int perPage, bool hasMore});
}

/// @nodoc
class __$$PaginatedListImplCopyWithImpl<T, $Res>
    extends _$PaginatedListCopyWithImpl<T, $Res, _$PaginatedListImpl<T>>
    implements _$$PaginatedListImplCopyWith<T, $Res> {
  __$$PaginatedListImplCopyWithImpl(_$PaginatedListImpl<T> _value,
      $Res Function(_$PaginatedListImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of PaginatedList
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? total = null,
    Object? currentPage = null,
    Object? perPage = null,
    Object? hasMore = null,
  }) {
    return _then(_$PaginatedListImpl<T>(
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<T>,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      perPage: null == perPage
          ? _value.perPage
          : perPage // ignore: cast_nullable_to_non_nullable
              as int,
      hasMore: null == hasMore
          ? _value.hasMore
          : hasMore // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$PaginatedListImpl<T> extends _PaginatedList<T> {
  const _$PaginatedListImpl(
      {required final List<T> items,
      required this.total,
      required this.currentPage,
      required this.perPage,
      required this.hasMore})
      : _items = items,
        super._();

  final List<T> _items;
  @override
  List<T> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  final int total;
  @override
  final int currentPage;
  @override
  final int perPage;
  @override
  final bool hasMore;

  @override
  String toString() {
    return 'PaginatedList<$T>(items: $items, total: $total, currentPage: $currentPage, perPage: $perPage, hasMore: $hasMore)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaginatedListImpl<T> &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.perPage, perPage) || other.perPage == perPage) &&
            (identical(other.hasMore, hasMore) || other.hasMore == hasMore));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_items),
      total,
      currentPage,
      perPage,
      hasMore);

  /// Create a copy of PaginatedList
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaginatedListImplCopyWith<T, _$PaginatedListImpl<T>> get copyWith =>
      __$$PaginatedListImplCopyWithImpl<T, _$PaginatedListImpl<T>>(
          this, _$identity);
}

abstract class _PaginatedList<T> extends PaginatedList<T> {
  const factory _PaginatedList(
      {required final List<T> items,
      required final int total,
      required final int currentPage,
      required final int perPage,
      required final bool hasMore}) = _$PaginatedListImpl<T>;
  const _PaginatedList._() : super._();

  @override
  List<T> get items;
  @override
  int get total;
  @override
  int get currentPage;
  @override
  int get perPage;
  @override
  bool get hasMore;

  /// Create a copy of PaginatedList
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaginatedListImplCopyWith<T, _$PaginatedListImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
