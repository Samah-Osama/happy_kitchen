import 'package:dio/dio.dart';

class ApiService {
  final Dio dio;

  ApiService({required this.dio});
  final String _baseUrl = 'http://88.223.94.70:8085/api/';

  Future<List<dynamic>> get({required String endpoint}) async {
    Response response = await dio.get('$_baseUrl$endpoint');
    return response.data;
  }
}
