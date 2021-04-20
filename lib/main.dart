import 'package:flutter/material.dart';
import 'package:iotlite/pages/auth/Signup.dart';
import 'package:iotlite/pages/device/DeviceDetail.dart';
import 'package:iotlite/pages/product/ProductDetail.dart';

import 'pages/Home.dart';
import 'pages/auth/Login.dart';
import 'pages/device/DeviceList.dart';
import 'pages/product/ProductList.dart';
import 'pages/scene/ScenesDetail.dart';
import 'pages/scene/ScenesList.dart';
import 'pages/user/UserCenter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IotLite',
      initialRoute: '/',
      routes: {
        '/': (context) => Home(),
        "/login": (context) => Login(),
        "/signup": (context) => Signup(),
        "/scenes": (context) => ScenesList(),
        "/scenes/detail": (context) => ScenesDetail(),
        '/product': (context) => ProductList(),
        '/product/detail': (context) => ProductDetail(),
        "/device": (context) => DeviceList(),
        "/device/detail": (context) => DeviceDetail(),
        "/user/center": (context) => UserCenter(),
      },
    );
  }
}
