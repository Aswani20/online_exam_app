import 'package:json_annotation/json_annotation.dart';

import '../../Domain_layer/model/resetPassword.dart';

part 'resetPasswordDto.g.dart';

@JsonSerializable()
class ResetPasswordDto {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "code")
  final int? code;

  ResetPasswordDto ({
    this.message,
    this.code,
  });

  factory ResetPasswordDto.fromJson(Map<String, dynamic> json) {
    return _$ResetPasswordDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ResetPasswordDtoToJson(this);
  }

  ResetPassword toResetPassword(){
    return ResetPassword(
      message: message,
      code: code
    );
  }
}


