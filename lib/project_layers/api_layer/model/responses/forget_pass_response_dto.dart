import '../../../domain_layer/entities/forget_pass_response_entity.dart';

class ForgetPassResponseDto extends ForgetPassResponseEntity {
  ForgetPassResponseDto({super.message, super.info, super.code});

  ForgetPassResponseDto.fromJson(Map<String, dynamic> json) {
    message = json['message'] as String?;
    info = json['info'] as String?;
    code = json['code'] as int?;
  }
}
