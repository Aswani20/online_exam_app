import 'package:json_annotation/json_annotation.dart';
import 'package:online_exam_app/project_layers/domain_layer/entities/sign_up_request_entity.dart';

part 'sign_up_request_dto.g.dart';

@JsonSerializable()
class SignUpRequestDto {
  @JsonKey(name: "username")
  final String? username;
  @JsonKey(name: "firstName")
  final String? firstName;
  @JsonKey(name: "lastName")
  final String? lastName;
  @JsonKey(name: "email")
  final String? email;
  @JsonKey(name: "password")
  final String? password;
  @JsonKey(name: "rePassword")
  final String? rePassword;
  @JsonKey(name: "phone")
  final String? phone;

  SignUpRequestDto ({
    this.username,
    this.firstName,
    this.lastName,
    this.email,
    this.password,
    this.rePassword,
    this.phone,
  });

  factory SignUpRequestDto.fromJson(Map<String, dynamic> json) {
    return _$SignUpRequestDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$SignUpRequestDtoToJson(this);
  }

  SignUpRequestEntity toEntity(){
    return SignUpRequestEntity(
      username: username,
      firstName: firstName,
      lastName: lastName,
      email: email,
      password: password,
      rePassword: rePassword,
      phone: phone,
    );
  }
}


