abstract class ExternalHttpDatasource {
  Future<Map<String, dynamic>> get(
      String path, Map<String, dynamic>? queryParameters);
}
