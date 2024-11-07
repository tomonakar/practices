import 'package:freezed_annotation/freezed_annotation.dart';

part 'paginated_list.freezed.dart';

@freezed
class PaginatedList<T> with _$PaginatedList<T> {
  const factory PaginatedList({
    required List<T> items,
    required int total,
    required int currentPage,
    required int perPage,
    required bool hasMore,
  }) = _PaginatedList<T>;

  const PaginatedList._();

  bool get isEmpty => items.isEmpty;
  bool get isNotEmpty => items.isNotEmpty;
  int get itemCount => items.length;

  int get totalPages => (total / perPage).ceil();
  bool get isFirstPage => currentPage == 1;
  bool get isLastPage => !hasMore;
}
