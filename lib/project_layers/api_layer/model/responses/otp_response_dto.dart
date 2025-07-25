import '../../../domain_layer/entities/otp_response_entity.dart';

class OtpResponseDto extends OtpResponseEntity {
  OtpResponseDto({super.message, super.status, super.code});

  OtpResponseDto.fromJson(Map<String, dynamic> json) {
    message = json['message'] as String?;
    status = json['status'] as String?;
    code = json['code'] as int?;
  }
}
