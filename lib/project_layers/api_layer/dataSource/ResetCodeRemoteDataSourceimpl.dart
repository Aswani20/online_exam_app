import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/project_layers/Domain_layer/model/Reset.dart';
import 'package:online_exam_app/project_layers/api_layer/api_client/api_client.dart';
import 'package:online_exam_app/project_layers/data_layer/dataSource/ResetCodeRemoteDataSource.dart';

@Injectable(as: ResetCodeRemoteDataSource)
class ResetCodeRemoteDataSourceImpl implements ResetCodeRemoteDataSource{
  final ApiClient _client;

  ResetCodeRemoteDataSourceImpl(this._client);

  @override
  Future<Reset> SendCode(String code) async {
    try{
      var response = await _client.postCode({'code': code});
      return response.toReset();
    }on DioException catch(e){
      print("DioException in sendCode: ${e.message}");
      print("Response data: ${e.response?.data}");
      throw Exception("Failed to send email: ${e.message}");
    }catch(e){
      print("Unknown error in sendCoed: $e");
      throw Exception("An unknown error occurred: $e");
    }
  }

}