// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserDTOImpl _$$UserDTOImplFromJson(Map<String, dynamic> json) =>
    _$UserDTOImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      profileImageUrl: json['profile_image_url'] as String?,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$UserDTOImplToJson(_$UserDTOImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'profile_image_url': instance.profileImageUrl,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };

_$UserProfileDTOImpl _$$UserProfileDTOImplFromJson(Map<String, dynamic> json) =>
    _$UserProfileDTOImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      bio: json['bio'] as String?,
      location: json['location'] as String?,
      website: json['website'] as String?,
      birthday: DateTime.parse(json['birth_date'] as String),
      preferences: json['preferences'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$$UserProfileDTOImplToJson(
        _$UserProfileDTOImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'bio': instance.bio,
      'location': instance.location,
      'website': instance.website,
      'birth_date': instance.birthday.toIso8601String(),
      'preferences': instance.preferences,
    };
