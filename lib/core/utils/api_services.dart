import 'package:dio/dio.dart';

class ApiServices {
  final _baseUrl = 'https://www.googleapis.com/books/v1/';
  final Dio dio;
  ApiServices({
    required this.dio,
  });

  Future<Map<String, dynamic>> get({required String endPoint}) async {
    var responce = await dio.get('$_baseUrl$endPoint');
    return responce.data;
  }
}
