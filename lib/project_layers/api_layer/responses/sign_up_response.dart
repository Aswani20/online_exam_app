import 'package:json_annotation/json_annotation.dart';
import 'package:online_exam_app/project_layers/api_layer/responses/user_dto.dart';
part 'sign_up_response.g.dart';

@JsonSerializable()
class SignUpResponseDto {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "token")
  final String? token;
  @JsonKey(name: "user")
  final UserDto? user;

  SignUpResponseDto ({
    this.message,
    this.token,
    this.user,
  });

  factory SignUpResponseDto.fromJson(Map<String, dynamic> json) {
    return _$SignUpResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$SignUpResponseDtoToJson(this);
  }
}




