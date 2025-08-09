import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/errors/failures.dart';
import 'package:online_exam_app/project_layers/domain_layer/entities/subject_response_entity.dart';
import 'package:online_exam_app/project_layers/domain_layer/repositories/subject_repo.dart';

@injectable
class SubjectUseCase{
  SubjectRepo subjectRepo;
  SubjectUseCase({required this.subjectRepo});

  Future<Either<Failures,SubjectResponseEntity>> getAllSubjects(){
    return subjectRepo.getAllSubjects();
  }

}