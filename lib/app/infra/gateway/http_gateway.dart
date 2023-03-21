import 'package:dio/dio.dart';

abstract class IHttpGateway {
  Future<Response> get(String path, Map<String, dynamic>? queryParameters);
}

class HttpGateway implements IHttpGateway {
  final Dio dio;

  HttpGateway(this.dio);

  @override
  Future<Response> get(String path, Map<String, dynamic>? queryParameters) {
    return dio.get('http://10.0.2.2:1323$path',
        queryParameters: queryParameters);
  }
}
