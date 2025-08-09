

class OtpRequestDto {
  String? resetCode;
  OtpRequestDto({this.resetCode});

  Map<String, dynamic> toJson() {
    return {'resetCode': resetCode};
  }
}
