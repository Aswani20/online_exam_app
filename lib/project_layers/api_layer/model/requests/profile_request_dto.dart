import 'package:json_annotation/json_annotation.dart';

part 'profile_request_dto.g.dart';

@JsonSerializable(includeIfNull: false)
class ProfileRequestDto {
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

  ProfileRequestDto({
    this.username,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
  });

  factory ProfileRequestDto.fromJson(Map<String, dynamic> json) =>
      _$ProfileRequestDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileRequestDtoToJson(this);
}
