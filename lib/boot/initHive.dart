import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:iotlite/entity/auth.dart';
import 'package:iotlite/entity/user.dart';
import 'package:path_provider/path_provider.dart';

Future<void> InitHive() async {
  print("初始化hive");
  Hive.initFlutter();
  var dir = await getApplicationDocumentsDirectory();

  Hive.init(dir.path);
  Hive.registerAdapter(AuthAdapter());
  Hive.registerAdapter(UserAdapter());
}
