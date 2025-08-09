import 'package:json_annotation/json_annotation.dart';
import 'package:online_exam_app/project_layers/domain_layer/entities/subject_response_entity.dart';
part 'subject_response.g.dart';

@JsonSerializable()
class SubjectResponseDto {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "metadata")
  final Metadata? metadata;
  @JsonKey(name: "subjects")
  final List<SubjectsDto>? subjects;

  SubjectResponseDto ({
    this.message,
    this.metadata,
    this.subjects,
  });

  factory SubjectResponseDto.fromJson(Map<String, dynamic> json) {
    return _$SubjectResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$SubjectResponseDtoToJson(this);
  }

  SubjectResponseEntity toEntity() {
    return SubjectResponseEntity(
      message: message,
      metadata: metadata?.toEntity(),
      subjects: subjects?.map((e) => e.toEntity()).toList(),
    );
  }
}

@JsonSerializable()
class Metadata {
  @JsonKey(name: "currentPage")
  final int? currentPage;
  @JsonKey(name: "numberOfPages")
  final int? numberOfPages;
  @JsonKey(name: "limit")
  final int? limit;

  Metadata ({
    this.currentPage,
    this.numberOfPages,
    this.limit,
  });

  factory Metadata.fromJson(Map<String, dynamic> json) {
    return _$MetadataFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$MetadataToJson(this);
  }

  MetadataEntity toEntity() {
    return MetadataEntity(
      currentPage: currentPage,
      numberOfPages: numberOfPages,
      limit: limit,
    );
  }
}

@JsonSerializable()
class SubjectsDto {
  @JsonKey(name: "_id")
  final String? id;
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "icon")
  final String? icon;
  @JsonKey(name: "createdAt")
  final String? createdAt;

  SubjectsDto ({
    this.id,
    this.name,
    this.icon,
    this.createdAt,
  });

  factory SubjectsDto.fromJson(Map<String, dynamic> json) {
    return _$SubjectsDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$SubjectsDtoToJson(this);
  }

  SubjectsEntity toEntity() {
    return SubjectsEntity(
      id: id,
      name: name,
      icon: icon,
      createdAt: createdAt,
    );
  }
}


