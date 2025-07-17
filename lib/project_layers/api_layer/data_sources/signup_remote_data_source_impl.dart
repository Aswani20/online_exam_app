import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/errors/failures.dart';
import 'package:online_exam_app/project_layers/api_layer/api_client/api_client.dart';
import 'package:online_exam_app/project_layers/api_layer/model/requests/sign_up_request_dto.dart';
import 'package:online_exam_app/project_layers/api_layer/model/responses/sign_up_response_dto.dart';
import 'package:online_exam_app/project_layers/data_layer/data_source/signup_remote_data_source.dart';
import 'package:online_exam_app/project_layers/domain_layer/entities/sign_up_request_entity.dart';
import 'package:online_exam_app/project_layers/domain_layer/entities/sign_up_response_entity.dart';

@Injectable(as: SignupRemoteDataSource)
class SignupRemoteDataSourceImpl extends SignupRemoteDataSource {
  final ApiClient _client;
  SignupRemoteDataSourceImpl(this._client);

  @override
  Future<SignUpResponseEntity> signup(SignUpRequestEntity request) async {
    var dtoResponse =await  _client.signUp(request: SignUpRequestDto());
    return dtoResponse.toEntity();
  }
}