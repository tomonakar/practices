import 'package:freezed_annotation/freezed_annotation.dart';

part 'data_source_exception.freezed.dart';

@freezed
@freezed
class DataSourceException with _$DataSourceException implements Exception {
  const factory DataSourceException.network({
    @Default('ネットワークエラーが発生しました') String? message,
  }) = NetworkException;

  const factory DataSourceException.notFound({
    @Default('リソースが見つかりません') String? message,
  }) = NotFoundException;

  const factory DataSourceException.unauthorized({
    @Default('認証エラーが発生しました') String? message,
  }) = UnauthorizedException;

  const factory DataSourceException.badRequest({
    @Default('リクエストが不正です') String? message,
  }) = BadRequestException;

  const factory DataSourceException.server({
    @Default('サーバーエラーが発生しました') String? message,
  }) = ServerException;

  const factory DataSourceException.cache({
    @Default('キャッシュエラーが発生しました') String? message,
  }) = CacheException;

  const factory DataSourceException.parse({
    @Default('データの解析に失敗しました') String? message,
  }) = ParseException;

  const factory DataSourceException.unknown({
    @Default('予期せぬエラーが発生しました') String? message,
  }) = UnknownException;

  const DataSourceException._();
}
