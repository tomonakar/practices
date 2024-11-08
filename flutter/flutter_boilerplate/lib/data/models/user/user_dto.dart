import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_boilerplate/domain/entities/user/user.dart';

part 'user_dto.freezed.dart';
part 'user_dto.g.dart';

@freezed
class UserDTO with _$UserDTO {
  const factory UserDTO({
    required String id,
    required String name,
    required String email,
    @JsonKey(name: 'profile_image_url') String? profileImageUrl,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
  }) = _UserDTO;

  const UserDTO._();

  factory UserDTO.fromJson(Map<String, dynamic> json) =>
      _$UserDTOFromJson(json);

  factory UserDTO.fromDomain(User user) {
    return UserDTO(
      id: user.id,
      name: user.name,
      email: user.email,
      profileImageUrl: user.profileImageUrl,
      createdAt: user.createdAt,
      updatedAt: user.updatedAt,
    );
  }

  User toDomain() {
    return User(
      id: id,
      name: name,
      email: email,
      profileImageUrl: profileImageUrl,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}

@freezed
class UserProfileDTO with _$UserProfileDTO {
  const factory UserProfileDTO({
    required String id,
    required String name,
    String? bio,
    String? location,
    String? website,
    @JsonKey(name: 'birth_date') required DateTime birthday,
    required Map<String, dynamic> preferences,
  }) = _UserProfileDTO;

  const UserProfileDTO._();

  factory UserProfileDTO.fromJson(Map<String, dynamic> json) =>
      _$UserProfileDTOFromJson(json);

  factory UserProfileDTO.fromDomain(UserProfile profile) {
    return UserProfileDTO(
      id: profile.id,
      name: profile.name,
      bio: profile.bio,
      location: profile.location,
      website: profile.website,
      birthday: profile.birthday,
      preferences: profile.preferences,
    );
  }

  UserProfile toDomain() {
    return UserProfile(
      id: id,
      name: name,
      bio: bio,
      location: location,
      website: website,
      birthday: birthday,
      preferences: preferences,
    );
  }
}
