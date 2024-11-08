import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

@freezed
class User with _$User {
  const factory User({
    required String id,
    required String name,
    required String email,
    String? profileImageUrl,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _User;

  const User._();

  bool get hasProfileImage => profileImageUrl != null;

  String get displayName => name.isNotEmpty ? name : email;

  bool get isEmailVerified => email.isNotEmpty;
}

@freezed
class UserProfile with _$UserProfile {
  const factory UserProfile({
    required String id,
    required String name,
    String? bio,
    String? location,
    String? website,
    required DateTime birthday,
    required Map<String, dynamic> preferences,
  }) = _UserProfile;

  const UserProfile._();

  bool get hasWebsite => website != null && website!.isNotEmpty;
  bool get hasBio => bio != null && bio!.isNotEmpty;
}
