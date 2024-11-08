import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_user_params.freezed.dart';

@freezed
class UpdateUserParams with _$UpdateUserParams {
  const factory UpdateUserParams({
    required String userId,
    required String name,
    required String email,
    String? profileImageUrl,
  }) = _UpdateUserParams;
}
