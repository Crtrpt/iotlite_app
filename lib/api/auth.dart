import 'package:iotlite/api/request.dart';

class auth {
  static Future postLogin(ctx) async {
    return Request.post("/auth/login", ctx);
  }

  static Future postSign(ctx) async {
    return Request.post("/auth/signup", ctx);
  }

  static Future postVerifEmail(ctx) async {
    return Request.post("/auth/verifEmail", ctx);
  }

  static Future postfind(ctx) async {
    return Request.post("/auth/find", ctx);
  }
}
