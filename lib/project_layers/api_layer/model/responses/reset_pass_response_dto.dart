import '../../../domain_layer/entities/reset_pass_response_entity.dart';

class ResetPassResponseDto extends ResetPassResponseEntity {
  ResetPassResponseDto({super.message, super.token, super.code});

  ResetPassResponseDto.fromJson(Map<String, dynamic> json) {
    message = json['message'] as String?;
    token = json['token'] as String?;
    code = json['code'] as int?;
  }
}
