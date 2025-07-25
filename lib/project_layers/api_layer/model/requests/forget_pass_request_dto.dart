import '../../../domain_layer/entities/forget_pass_response_entity.dart';

class ForgetPassRequestDto {
  String? email;

  ForgetPassRequestDto({this.email});

  Map<String, dynamic> toJson() {
    return {'email': email};
  }
}
