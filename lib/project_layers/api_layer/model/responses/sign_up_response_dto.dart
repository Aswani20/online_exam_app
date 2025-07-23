import 'package:json_annotation/json_annotation.dart';
import 'package:online_exam_app/project_layers/domain_layer/entities/sign_up_response_entity.dart';
part 'sign_up_response_dto.g.dart';

@JsonSerializable()
class SignUpResponseDto {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "token")
  final String? token;
  @JsonKey(name: "user")
  final UserDto? user;
  @JsonKey(name: "code")
  final int? code;

  SignUpResponseDto ({
    this.message,
    this.token,
    this.user,
    this.code
  });

  factory SignUpResponseDto.fromJson(Map<String, dynamic> json) {
    return _$SignUpResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$SignUpResponseDtoToJson(this);
  }

  SignUpResponseEntity toEntity(){
    return SignUpResponseEntity(
      message: message,
      token: token,
      user: user?.toEntity(),
      code: code,
    );
  }
}

@JsonSerializable()
class UserDto {
  @JsonKey(name: "username")
  final String? username;
  @JsonKey(name: "firstName")
  final String? firstName;
  @JsonKey(name: "lastName")
  final String? lastName;
  @JsonKey(name: "email")
  final String? email;
  @JsonKey(name: "phone")
  final String? phone;
  @JsonKey(name: "role")
  final String? role;
  @JsonKey(name: "isVerified")
  final bool? isVerified;
  @JsonKey(name: "_id")
  final String? Id;
  @JsonKey(name: "createdAt")
  final String? createdAt;

  UserDto ({
    this.username,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.role,
    this.isVerified,
    this.Id,
    this.createdAt,
  });

  factory UserDto.fromJson(Map<String, dynamic> json) {
    return _$UserDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$UserDtoToJson(this);
  }

  UserEntity toEntity(){
    return UserEntity(
      username: username,
      firstName: firstName,
      lastName: lastName,
      email: email,
      phone: phone,
      role: role,
      isVerified: isVerified,
      id: Id,
      createdAt: createdAt,);
  }

}


