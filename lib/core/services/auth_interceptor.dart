import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

@injectable
class AuthInterceptor extends Interceptor {
  final FlutterSecureStorage _storage;
  AuthInterceptor(this._storage);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final token = await _storage.read(key: 'token');
    if (token != null && token.isNotEmpty) {
      options.headers['token'] = token;
    }
    print('🔐 Attaching token: $token');

    handler.next(options);
  }
}
