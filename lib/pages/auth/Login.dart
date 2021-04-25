import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:iotlite/api/auth.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController accountContrller = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  @override
  void initState() {
    super.initState();
    print("初始化");
    accountContrller.addListener(() {
      print("这是什么？？？");
    });
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
    auth
        .postLogin({
          "account": account,
          "password": sha256.convert(utf8.encode(password)).toString()
        })
        .then((value) => {
              if (value["code"] == 0)
                {Navigator.pushNamed(context, "/")}
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
      body: ListView(
        padding: EdgeInsets.all(10),
        children: [
          SizedBox(
            height: 200,
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
    );
  }
}
