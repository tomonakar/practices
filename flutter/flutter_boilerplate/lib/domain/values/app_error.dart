import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_error.freezed.dart';

@freezed
class AppError with _$AppError {
  const factory AppError.network({
    @Default('ネットワークエラーが発生しました') String? message,
  }) = NetworkError;

  const factory AppError.api({
    int? statusCode,
    @Default('APIエラーが発生しました') String? message,
  }) = ApiError;

  const factory AppError.unauthorized({
    @Default('認証エラーが発生しました') String? message,
  }) = UnauthorizedError;

  const factory AppError.unknown({
    @Default('予期せぬエラーが発生しました') String? message,
  }) = UnknownError;

  const factory AppError.invalidData({
    @Default('データの形式が正しくありません') String? message,
  }) = InvalidDataError;

  const factory AppError.cache({
    @Default('キャッシュエラーが発生しました') String? message,
  }) = CacheError;

  const AppError._();
}
