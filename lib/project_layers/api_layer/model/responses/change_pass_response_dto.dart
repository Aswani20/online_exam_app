import 'package:json_annotation/json_annotation.dart';

import '../../../domain_layer/entities/change_pass_response_entity.dart';

part 'change_pass_response_dto.g.dart';

@JsonSerializable()
class ChangePassResponseDto {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "token")
  final String? token;

  ChangePassResponseDto ({
    this.message,
    this.token,
  });

  factory ChangePassResponseDto.fromJson(Map<String, dynamic> json) {
    return _$ChangePassResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ChangePassResponseDtoToJson(this);
  }

  ChangePassResponseEntity toEntity() {
    return ChangePassResponseEntity(
      message: this.message,
      token: this.token,
    );
  }
}


