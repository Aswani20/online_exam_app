

class ForgetPassRequestDto {
  String? email;

  ForgetPassRequestDto({this.email});

  Map<String, dynamic> toJson() {
    return {'email': email};
  }
}
