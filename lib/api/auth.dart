import 'package:iotlite/api/request.dart';

class auth {
  static Future postLogin(ctx) async {
    return Request.get("/auth/login", ctx);
  }

  static Future postSign(ctx) async {
    return Future.value(1);
  }

  static Future postVerifEmail(ctx) async {
    return Future.value(1);
  }

  static Future postfind(ctx) async {
    return Future.value(1);
  }
}
