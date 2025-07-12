import 'package:json_annotation/json_annotation.dart';
part 'sign_up_request.g.dart';

@JsonSerializable()
class SignUpRequestDto {
  final String username;
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final String rePassword;
  final String phone;

  SignUpRequestDto({
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.rePassword,
    required this.phone,
  });

  factory SignUpRequestDto.fromJson(Map<String, dynamic> json) =>
      _$SignUpRequestDtoFromJson(json);

  Map<String, dynamic> toJson() => _$SignUpRequestDtoToJson(this);
}
