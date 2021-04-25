import 'package:hive/hive.dart';
import 'package:iotlite/entity/user.dart';

part 'auth.g.dart';

@HiveType(typeId: 0)
class Auth extends HiveObject {
  @HiveField(0)
  String token = "";

  @HiveField(1)
  User user = new User();
}
