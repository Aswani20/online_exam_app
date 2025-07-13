import 'package:json_annotation/json_annotation.dart';

import '../../Domain_layer/model/Forgot.dart';

part 'ForgotDto.g.dart';

@JsonSerializable()
class ForgotDto {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "info")
  final String? info;

  ForgotDto ({
    this.message,
    this.info,
  });

  factory ForgotDto.fromJson(Map<String, dynamic> json) {
    return _$ForgotDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ForgotDtoToJson(this);
  }

  Forgot toForgot() {
    return Forgot(
      message: message,
      info: info,
    );
  }
}


