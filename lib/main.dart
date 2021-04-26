import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iotlite/pages/auth/Signup.dart';
import 'package:iotlite/pages/device/DeviceDetail.dart';
import 'package:iotlite/pages/system/SystemSetting.dart';
import 'package:iotlite/pages/tool/DeviceScan.dart';
import 'package:iotlite/pages/tool/DeviceWifi.dart';

import 'boot/initHive.dart';
import 'pages/Home.dart';
import 'pages/auth/Forgetpassword.dart';
import 'pages/auth/Login.dart';
import 'pages/device/DeviceList.dart';
import 'pages/device/DeviceNew.dart';
import 'pages/product/ProductList.dart';
import 'pages/product/ProductNew.dart';
import 'pages/scene/ScenesDetail.dart';
import 'pages/scene/ScenesList.dart';
import 'pages/scene/ScenesNew.dart';
import 'pages/user/UserCenter.dart';

void main() {
  //初始化hive
  InitHive();
  runApp(IotLite());
}

class IotLite extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarDividerColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.light,
    ));

    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.top]);
    return MaterialApp(
      title: 'IotLite',
      theme: ThemeData(
        primaryColor: Colors.blue,
        accentColor: Colors.amber,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => Home(),
        "/login": (context) => Login(),
        "/signup": (context) => Signup(),
        "/forget": (context) => ForgetPassword(),
        "/scenes": (context) => ScenesList(),
        "/scenes/detail": (context) => ScenesDetail(),
        "/scenes/new": (context) => ScenesNew(),
        '/product': (context) => ProductList(),
        '/product/new': (context) => ProductNew(),
        "/product/new": (context) => ProductNew(),
        "/device": (context) => DeviceList(),
        "/device/detail": (context) => DeviceDetail(),
        "/device/new": (context) => DeviceNew(),
        "/user/center": (context) => UserCenter(),
        "/system/setting": (context) => SystemSetting(),
        "/tool/scan": (context) => DeviceScan(),
        "/tool/wifi": (context) => DeviceWifi(),
      },
    );
  }
}
