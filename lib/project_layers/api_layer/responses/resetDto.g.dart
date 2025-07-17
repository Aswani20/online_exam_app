// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resetDto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResetDto _$ResetDtoFromJson(Map<String, dynamic> json) => ResetDto(
  message: json['message'] as String?,
  code: (json['code'] as num?)?.toInt(),
);

Map<String, dynamic> _$ResetDtoToJson(ResetDto instance) => <String, dynamic>{
  'message': instance.message,
  'code': instance.code,
};
