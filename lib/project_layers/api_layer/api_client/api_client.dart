import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/project_layers/api_layer/model/requests/forget_pass_request_dto.dart';
import 'package:online_exam_app/project_layers/api_layer/model/requests/otp_request_dto.dart';
import 'package:online_exam_app/project_layers/api_layer/model/requests/reset_pass_request_dto.dart';
import 'package:online_exam_app/project_layers/api_layer/model/responses/forget_pass_response_dto.dart';
import 'package:online_exam_app/project_layers/api_layer/model/responses/sign_up_response_dto.dart';
import 'package:online_exam_app/project_layers/api_layer/model/requests/sign_up_request_dto.dart';
import 'package:retrofit/retrofit.dart';

import '../model/responses/otp_response_dto.dart';
import '../model/responses/reset_pass_response_dto.dart';
part 'api_client.g.dart';

@singleton
@RestApi(baseUrl: 'https://exam.elevateegy.com/api/')
abstract class ApiClient {
  @factoryMethod
  factory ApiClient(Dio dio) = _ApiClient;

  @POST("/v1/auth/signup")
  Future<HttpResponse<SignUpResponseDto>> signUp({
    @Body() required SignUpRequestDto request,
  });

  @POST("/v1/auth/forgotPassword")
  Future<HttpResponse<ForgetPassResponseDto>> forgetPass({
    @Body() required ForgetPassRequestDto forgetPassRequest,
  });

  @POST("/v1/auth/verifyResetCode")
  Future<HttpResponse<OtpResponseDto>> otpVerify({
    @Body() required OtpRequestDto otpRequest,
  });

  @PUT("/v1/auth/resetPassword")
  Future<HttpResponse<ResetPassResponseDto>> resetPass({
    @Body() required ResetPassRequestDto resetPassRequest,
  });
}
