import 'package:dio/dio.dart';
import 'package:online_exam_app/project_layers/api_layer/requests/sign_up_request.dart';
import 'package:online_exam_app/project_layers/api_layer/responses/sign_up_response.dart';
import 'package:retrofit/retrofit.dart';
part 'api_client.g.dart';

@RestApi(baseUrl: 'https://exam.elevateegy.com/api/')
abstract class ApiClient{
  factory ApiClient(Dio dio, {String? baseUrl}) = _ApiClient;


  @POST("/v1/auth/signup")
  Future<SignUpResponseDto> signUp({@Body() required SignUpRequestDto request});
}