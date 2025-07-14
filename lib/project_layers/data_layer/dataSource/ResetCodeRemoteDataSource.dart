import '../../Domain_layer/model/Reset.dart';

abstract class ResetCodeRemoteDataSource{
  Future<Reset> SendCode(String code);
}