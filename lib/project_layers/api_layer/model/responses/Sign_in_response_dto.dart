import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../domain_layer/entities/sign_in_response_entity.dart';
part 'Sign_in_response_dto.g.dart';

@JsonSerializable()
class SigninResponseDto {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "token")
  final String? token;
  @JsonKey(name: "user")
  final User? user;

  SigninResponseDto ({
    this.message,
    this.token,
    this.user,
  });

  factory SigninResponseDto.fromJson(Map<String, dynamic> json) {
    return _$SigninResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$SigninResponseDtoToJson(this);
  }

  SignInResponseEntity toEntity(){
    return SignInResponseEntity(
      message: message,
      token: token,
      user: user?.toEntity(),
    );
  }
}

@JsonSerializable()
class User {
  @JsonKey(name: "_id")
  final String? Id;
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
  @JsonKey(name: "createdAt")
  final String? createdAt;

  User ({
    this.Id,
    this.username,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.role,
    this.isVerified,
    this.createdAt,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return _$UserFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$UserToJson(this);
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


