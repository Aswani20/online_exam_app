import 'package:dartz/dartz.dart';
import 'package:online_exam_app/core/errors/failures.dart';
import 'package:online_exam_app/project_layers/domain_layer/entities/subject_response_entity.dart';

abstract class SubjectRepo{
  Future<Either<Failures,SubjectResponseEntity>> getAllSubjects();
}