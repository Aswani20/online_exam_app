import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/errors/failures.dart';
import 'package:online_exam_app/project_layers/data_layer/data_source/signup_remote_data_source.dart';
import 'package:online_exam_app/project_layers/domain_layer/entities/sign_up_request_entity.dart';
import 'package:online_exam_app/project_layers/domain_layer/entities/sign_up_response_entity.dart';
import 'package:online_exam_app/project_layers/domain_layer/repositories/signup_repo.dart';

@Injectable(as: SignupRepo)
class SignupRepoImpl implements SignupRepo{
  final SignupRemoteDataSource _remoteDataSource;
  SignupRepoImpl(this._remoteDataSource);
  
  @override
  Future<SignUpResponseEntity> signup(SignUpRequestEntity request) async{
    var response = await _remoteDataSource.signup(request);
    return response;
  } 
  
}