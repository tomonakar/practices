import 'package:freezed_annotation/freezed_annotation.dart';

part 'data_source_exception.freezed.dart';

@freezed
class DataSourceException with _$DataSourceException implements Exception {
  const factory DataSourceException.network({String? message}) =
      NetworkException;
  const factory DataSourceException.notFound({String? message}) =
      NotFoundException;
  const factory DataSourceException.unauthorized({String? message}) =
      UnauthorizedException;
  const factory DataSourceException.badRequest({String? message}) =
      BadRequestException;
  const factory DataSourceException.server({String? message}) = ServerException;
  const factory DataSourceException.cache({String? message}) = CacheException;
  const factory DataSourceException.parse({String? message}) = ParseException;
  const factory DataSourceException.unknown({String? message}) =
      UnknownException;

  const DataSourceException._();

  @override
  String get message => when(
        network: (message) => message ?? 'ネットワークエラーが発生しました',
        notFound: (message) => message ?? 'リソースが見つかりません',
        unauthorized: (message) => message ?? '認証エラーが発生しました',
        badRequest: (message) => message ?? 'リクエストが不正です',
        server: (message) => message ?? 'サーバーエラーが発生しました',
        cache: (message) => message ?? 'キャッシュエラーが発生しました',
        parse: (message) => message ?? 'データの解析に失敗しました',
        unknown: (message) => message ?? '予期せぬエラーが発生しました',
      );
}
