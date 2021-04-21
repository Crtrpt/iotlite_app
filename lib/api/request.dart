import 'package:dio/dio.dart';

import '../config.dart';

class Request {
  static var dio = Dio(BaseOptions(baseUrl: config['host']!));
  static dynamic get(path, data) async {
    return await dio.get(path, queryParameters: data);
  }

  static dynamic post(path, data) async {
    return await dio.post(path, data: data);
  }
}
