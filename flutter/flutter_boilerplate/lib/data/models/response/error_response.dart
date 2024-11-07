import 'package:freezed_annotation/freezed_annotation.dart';

part 'error_response.freezed.dart';
part 'error_response.g.dart';

@freezed
class ErrorResponse with _$ErrorResponse {
  const factory ErrorResponse({
    required bool success,
    @JsonKey(name: 'error_code') required String errorCode,
    @JsonKey(name: 'error_message') required String errorMessage,
    @JsonKey(name: 'error_details') Map<String, dynamic>? errorDetails,
  }) = _ErrorResponse;

  factory ErrorResponse.fromJson(Map<String, dynamic> json) =>
      _$ErrorResponseFromJson(json);
}
