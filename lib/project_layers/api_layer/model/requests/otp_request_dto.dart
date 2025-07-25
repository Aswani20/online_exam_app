import '../../../domain_layer/entities/otp_response_entity.dart';

class OtpRequestDto {
  String? resetCode;
  OtpRequestDto({this.resetCode});

  Map<String, dynamic> toJson() {
    return {'resetCode': resetCode};
  }
}
