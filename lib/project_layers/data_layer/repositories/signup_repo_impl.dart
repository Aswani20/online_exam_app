import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/errors/failures.dart';
import 'package:online_exam_app/project_layers/data_layer/data_source/signup_remote_data_source.dart';
import 'package:online_exam_app/project_layers/domain_layer/entities/sign_up_response_entity.dart';
import 'package:online_exam_app/project_layers/domain_layer/repositories/signup_repo.dart';

@Injectable(as: SignupRepo)
class SignupRepoImpl implements SignupRepo{
  final SignupRemoteDataSource _remoteDataSource;
  SignupRepoImpl(this._remoteDataSource);
  
  @override
  Future<Either<Failures,SignUpResponseEntity>> signup({
    required String username,
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String rePassword,
    required String phone,
  }) async{
    var response = await _remoteDataSource.signup(username: username,email: email,firstName: firstName,lastName: lastName,password: password,rePassword: rePassword, phone: phone);
    return response.fold((error)=>Left(error), (response) => Right(response));
  } 
  
}