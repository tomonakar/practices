import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_boilerplate/domain/entities/user/user.dart';

part 'user_dto.freezed.dart';
part 'user_dto.g.dart';

@freezed
class UserDTO with _$UserDTO {
  const factory UserDTO({
    required String id,
    @JsonKey(name: 'user_name') required String name,
    @JsonKey(name: 'email_address') required String email,
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
