import 'package:json_annotation/json_annotation.dart';

part 'change_pass_request_dto.g.dart';

@JsonSerializable()
class ChangePassRequestDto {
  @JsonKey(name: "oldPassword")
  final String? oldPassword;
  @JsonKey(name: "password")
  final String? password;
  @JsonKey(name: "rePassword")
  final String? rePassword;

  ChangePassRequestDto ({
    this.oldPassword,
    this.password,
    this.rePassword,
  });

  factory ChangePassRequestDto.fromJson(Map<String, dynamic> json) {
    return _$ChangePassRequestDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ChangePassRequestDtoToJson(this);
  }
}


