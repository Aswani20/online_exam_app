import 'package:json_annotation/json_annotation.dart';
import 'package:online_exam_app/project_layers/Domain_layer/model/resetCodeModel.dart';

part 'resetDto.g.dart';

@JsonSerializable()
class ResetDto {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "code")
  final int? code;

  ResetDto ({
    this.message,
    this.code,
  });

  factory ResetDto.fromJson(Map<String, dynamic> json) {
    return _$ResetDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ResetDtoToJson(this);
  }

  ResetCodeModel toResetCode(){
    return ResetCodeModel(
      message: message,
      code: code
    );
  }
}


