// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ErrorResponseImpl _$$ErrorResponseImplFromJson(Map<String, dynamic> json) =>
    _$ErrorResponseImpl(
      success: json['success'] as bool,
      errorCode: json['error_code'] as String,
      errorMessage: json['error_message'] as String,
      errorDetails: json['error_details'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$ErrorResponseImplToJson(_$ErrorResponseImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'error_code': instance.errorCode,
      'error_message': instance.errorMessage,
      'error_details': instance.errorDetails,
    };
