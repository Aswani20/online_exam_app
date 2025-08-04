
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/errors/failures.dart';
import 'package:online_exam_app/project_layers/api_layer/api_client/api_client.dart';
import 'package:online_exam_app/project_layers/data_layer/data_source/profile_remote_data_source.dart';
import 'package:online_exam_app/project_layers/domain_layer/entities/profile_response_entity.dart';

import '../model/requests/profile_request_dto.dart';

@Injectable(as: ProfileRemoteDataSource)
class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource{
  ApiClient _apiClient;
  ProfileRemoteDataSourceImpl(this._apiClient);

  @override
  Future<Either<Failures, ProfileResponseEntity>> getProfile() async {
    try{
      var response = await _apiClient.getProfile();
      var statusCode = response.response.statusCode;

      if(statusCode! >= 200 && statusCode < 300){
        return Right(response.data.toEntity());
      } else {
        return Left(
          ServerError(errorMessage: response.data.message ?? "Server Error"),
        );
      }
    } on DioException catch(e) {
      return left(
        ServerError(
            errorMessage: e.response?.data.toString() ?? "Unknown Dio error"
        )
      );
    } catch (e) {
      return left(ServerError(errorMessage: "Unexpected error: $e"));
    }
  }

  @override
  Future<Either<Failures, ProfileResponseEntity>> editProfile({
    required String userName,
    required String firstName,
    required String lastName,
    required String email,
    required String phoneNumber,
  }) async {
    try{
      var response = await _apiClient.editProfile(
        request: ProfileRequestDto(
          username: userName,
          firstName: firstName,
          lastName: lastName,
          email: email,
          phone: phoneNumber,
        ),
      );
      var statusCode = response.response.statusCode;
      if(statusCode! >= 200 && statusCode < 300){
        return Right(response.data.toEntity());
      } else {
        return Left(
          ServerError(errorMessage: response.data.message ?? "Server Error"),
        );
      }
    } on DioException catch(e){
      return left(
        ServerError(
            errorMessage: e.response?.data.toString() ?? "Unknown Dio error"
        )
      );
    } catch (e) {
      return left(ServerError(errorMessage: "Unexpected error: $e"));
    }
  }
}