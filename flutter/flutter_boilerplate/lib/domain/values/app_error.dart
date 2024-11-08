import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_error.freezed.dart';

@freezed
class AppError with _$AppError {
  const factory AppError.network({String? message}) = NetworkError;
  const factory AppError.api(int? statusCode, {String? message}) = ApiError;
  const factory AppError.unauthorized({String? message}) = UnauthorizedError;
  const factory AppError.unknown({String? message}) = UnknownError;
  const factory AppError.invalidData({String? message}) = InvalidDataError;
  const factory AppError.cache({String? message}) = CacheError;

  const AppError._();

  @override
  String get message => when(
        network: (message) => message ?? 'ネットワークエラーが発生しました',
        api: (code, message) => message ?? 'APIエラーが発生しました',
        unauthorized: (message) => message ?? '認証エラーが発生しました',
        unknown: (message) => message ?? '予期せぬエラーが発生しました',
        invalidData: (message) => message ?? 'データの形式が正しくありません',
        cache: (message) => message ?? 'キャッシュエラーが発生しました',
      );
}
