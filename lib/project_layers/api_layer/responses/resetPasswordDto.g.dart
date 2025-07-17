// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resetPasswordDto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResetPasswordDto _$ResetPasswordDtoFromJson(Map<String, dynamic> json) =>
    ResetPasswordDto(
      message: json['message'] as String?,
      code: (json['code'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ResetPasswordDtoToJson(ResetPasswordDto instance) =>
    <String, dynamic>{'message': instance.message, 'code': instance.code};
