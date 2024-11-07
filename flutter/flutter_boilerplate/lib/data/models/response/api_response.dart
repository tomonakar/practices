import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_response.freezed.dart';
part 'api_response.g.dart';

@Freezed(genericArgumentFactories: true)
class ApiResponse<T> with _$ApiResponse<T> {
  const factory ApiResponse({
    required bool success,
    T? data,
    @JsonKey(name: 'error_code') String? errorCode,
    @JsonKey(name: 'error_message') String? errorMessage,
    required Map<String, List<String>> headers,
  }) = _ApiResponse;

  const ApiResponse._(); // プライベートコンストラクタを追加

  factory ApiResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object?) fromJsonT,
  ) =>
      _$ApiResponseFromJson(json, fromJsonT);

  // ヘッダーから便利なゲッターを提供
  DateTime? get serverTime {
    final dateHeader = headers['date']?.first;
    if (dateHeader != null) {
      try {
        return HttpDate.parse(dateHeader);
      } catch (_) {
        return null;
      }
    }
    return null;
  }

  String? get contentType => headers['content-type']?.first;
  String? get etag => headers['etag']?.first;
}
