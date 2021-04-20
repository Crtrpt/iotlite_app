import 'package:flutter/material.dart';
import 'package:iotlite/pages/auth/Signup.dart';
import 'package:iotlite/pages/device/DeviceDetail.dart';

import 'pages/Home.dart';
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
  runApp(IotLite());
}

class IotLite extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
      },
    );
  }
}
