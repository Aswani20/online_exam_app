// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileRequestDto _$ProfileRequestDtoFromJson(Map<String, dynamic> json) =>
    ProfileRequestDto(
      username: json['username'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
    );

Map<String, dynamic> _$ProfileRequestDtoToJson(ProfileRequestDto instance) =>
    <String, dynamic>{
      if (instance.username case final value?) 'username': value,
      if (instance.firstName case final value?) 'firstName': value,
      if (instance.lastName case final value?) 'lastName': value,
      if (instance.email case final value?) 'email': value,
      if (instance.phone case final value?) 'phone': value,
    };
