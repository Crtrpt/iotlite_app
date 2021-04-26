import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive/hive.dart';
import 'package:iotlite/api/auth.dart';
import 'package:iotlite/entity/auth.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController accountContrller = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  late Future<Box<Auth>> authStorage;

  @override
  void initState() {
    authStorage = Hive.openBox<Auth>('userBox');
    super.initState();
  }

  @override
  void dispose() {
    accountContrller.dispose();
    passwordController.dispose();
    super.dispose();
  }

  login() {
    var account = accountContrller.value.text;
    var password = passwordController.value.text;
    Auth authvar;
    auth
        .postLogin({
          "account": account,
          "password": sha256.convert(utf8.encode(password)).toString()
        })
        .then((value) => {
              if (value["code"] == 0)
                {
                  authvar = new Auth(),
                  authvar.token = value["data"]["token"],
                  authvar.user.name = value["data"]["user"]['name'],
                  print(authvar),
                  authStorage.then((value) => value.put("auth", authvar)),
                  Navigator.pushNamed(context, "/")
                }
              else
                {
                  showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                            title: Text("提示"),
                            content: Text(value['msg']),
                          ))
                }
            })
        .catchError((e) => {
              print(e.toString()),
              showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                        title: Text("提示"),
                        content: Text("网络繁忙请稍后重试"),
                      ))
            });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        SvgPicture.asset(
          'images/bg.svg',
          height: MediaQuery.of(context).size.height,
          fit: BoxFit.cover,
        ),
        ListView(
          padding: EdgeInsets.all(10),
          children: [
            SizedBox(
              height: 300,
            ),
            TextField(
              controller: accountContrller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: '账号',
              ),
            ),
            SizedBox(
              height: 5,
            ),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: '密码',
              ),
            ),
            ElevatedButton(onPressed: login, child: Text("登录")),
            ElevatedButton(
                onPressed: () => {Navigator.pushNamed(context, "/signup")},
                child: Text("注册")),
            ElevatedButton(
                onPressed: () => {Navigator.pushNamed(context, "/forget")},
                child: Text("找回密码"))
          ],
        ),
      ],
    ));
  }
}
