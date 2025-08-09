class SubjectResponseEntity {
  final String? message;
  final MetadataEntity? metadata;
  final List<SubjectsEntity>? subjects;
  SubjectResponseEntity({this.message, this.metadata, this.subjects});
}

class MetadataEntity {
  final int? currentPage;
  final int? numberOfPages;
  final int? limit;
  MetadataEntity({this.currentPage, this.numberOfPages, this.limit});
}

class SubjectsEntity {
  final String? id;
  final String? name;
  final String? icon;
  final String? createdAt;
  SubjectsEntity({this.id, this.name, this.icon, this.createdAt});
}
