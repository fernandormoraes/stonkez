import 'package:dio/dio.dart';
import 'package:stonkez/app/infra/datasources/external/external_datasource.dart';
import 'package:stonkez/app/infra/gateway/http_gateway.dart';

class RemoteHttpDatasource implements ExternalHttpDatasource {
  final IHttpGateway httpGateway;

  RemoteHttpDatasource(this.httpGateway);

  @override
  Future<Map<String, dynamic>> get(
      String path, Map<String, dynamic>? queryParameters) async {
    Response response = await httpGateway.get(path, queryParameters);

    return response.data;
  }
}
