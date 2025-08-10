import 'package:json_annotation/json_annotation.dart';
import 'package:online_exam_app/project_layers/domain_layer/entities/profile_response_entity.dart';

part 'profile_response_dto.g.dart';

@JsonSerializable()
class ProfileResponseDto {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "user")
  final UserDto? user;

  ProfileResponseDto ({
    this.message,
    this.user,
  });

  factory ProfileResponseDto.fromJson(Map<String, dynamic> json) {
    return _$ProfileResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ProfileResponseDtoToJson(this);
  }

  ProfileResponseEntity toEntity(){
    return ProfileResponseEntity(
      message: message,
      user: user?.toEntity(),
    );
  }
}

@JsonSerializable()
class UserDto {
  @JsonKey(name: "_id")
  final String? id;
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
  @JsonKey(name: "passwordChangedAt")
  final String? passwordChangedAt;

  UserDto ({
    this.id,
    this.username,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.role,
    this.isVerified,
    this.createdAt,
    this.passwordChangedAt,
  });

  factory UserDto.fromJson(Map<String, dynamic> json) {
    return _$UserDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$UserDtoToJson(this);
  }

  UserEntity toEntity(){
    return UserEntity(
      id: id,
      username: username,
      firstName: firstName,
      lastName: lastName,
      email: email,
      phone: phone,
      role: role,
    );
  }
}

