import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/errors/failures.dart';
import 'package:online_exam_app/project_layers/data_layer/data_source/subject_remote_data_source.dart';
import 'package:online_exam_app/project_layers/domain_layer/entities/subject_response_entity.dart';
import 'package:online_exam_app/project_layers/domain_layer/repositories/subject_repo.dart';


@Injectable(as: SubjectRepo)
class SubjectRepoImpl implements SubjectRepo{
  final SubjectRemoteDataSource _remoteDataSource;
  SubjectRepoImpl(this._remoteDataSource);

  @override
  Future<Either<Failures, SubjectResponseEntity>> getAllSubjects() async{
    var response = await _remoteDataSource.getAllSubjects();
    return response.fold((error) => Left(error), (response) => Right(response));
  }
}