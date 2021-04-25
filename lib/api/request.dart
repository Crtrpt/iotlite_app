import 'package:dio/dio.dart';

import '../config.dart';

class Request {
  static var dio = Dio(BaseOptions(baseUrl: config['host']!));
  static dynamic get(path, data) async {
    Response res = await dio.get(path, queryParameters: data);
    print(res);
    return res.data;
  }

  static dynamic post(path, data) async {
    Response res = await dio.post(path, data: data);
    print(res);
    return res.data;
  }
}
