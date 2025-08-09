import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/errors/failures.dart';
import 'package:online_exam_app/project_layers/api_layer/api_client/api_client.dart';
import 'package:online_exam_app/project_layers/data_layer/data_source/subject_remote_data_source.dart';
import 'package:online_exam_app/project_layers/domain_layer/entities/subject_response_entity.dart';

import '../../presentation_layer/authentication/signin/cubit/sign_in_view_model.dart';

@Injectable(as: SubjectRemoteDataSource)
class SubjectRemoteDataSourceImpl implements SubjectRemoteDataSource {
  final ApiClient _apiClient;

  SubjectRemoteDataSourceImpl(this._apiClient);

  @override
  Future<Either<Failures, SubjectResponseEntity>> getAllSubjects() async {
    try {
      final token = await storage.read(key: 'token');
      var response = await _apiClient.getAllSubjects(token: token ?? "");
      var statusCode = response.response.statusCode;
      if (statusCode! >= 200 && statusCode < 300) {
        return Right(response.data.toEntity());
      } else {
        return Left(
          ServerError(errorMessage: response.data.message ?? "Server Error"),
        );
      }
    } on DioException catch (e) {
      return left(
        ServerError(
          errorMessage: e.response?.data.toString() ?? "Unknown Dio error",
        ),
      );
    } catch (e) {
      return left(ServerError(errorMessage: "Unexpected error: $e"));
    }
  }
}
