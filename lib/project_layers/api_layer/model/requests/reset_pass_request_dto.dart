import '../../../domain_layer/entities/forget_pass_response_entity.dart';

class ResetPassRequestDto {
  String email;
  String newPassword;
  ResetPassRequestDto({required this.email, required this.newPassword});

  Map<String, dynamic> toJson() {
    return {'email': email, 'newPassword': newPassword};
  }
}
