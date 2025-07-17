import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/project_layers/api_layer/model/requests/sign_up_request_dto.dart';
import 'package:online_exam_app/project_layers/api_layer/model/responses/sign_up_response_dto.dart';
import 'package:retrofit/retrofit.dart';
part 'api_client.g.dart';

@injectable
@singleton
@RestApi(baseUrl: 'https://exam.elevateegy.com/api/')
abstract class ApiClient{
  @factoryMethod
  factory ApiClient(Dio dio, {String? baseUrl}) = _ApiClient;


  @POST("v1/auth/signup")
  Future<SignUpResponseDto> signUp({@Body() required SignUpRequestDto request});
}