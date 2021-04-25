import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:iotlite/api/auth.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController accountContrller = new TextEditingController();

  TextEditingController usernameContrller = new TextEditingController();

  TextEditingController passwordController = new TextEditingController();

  TextEditingController emailController = new TextEditingController();

  signup() {
    var account = accountContrller.value.text;
    var password = passwordController.value.text;
    var email = emailController.value.text;
    var username = usernameContrller.value.text;
    auth
        .postSign({
          "account": account,
          username: username,
          "password": sha256.convert(utf8.encode(password)).toString(),
          "email": email
        })
        .then((value) => {
              if (value["code"] == 0)
                {
                  showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                            title: Text("提示"),
                            content: Text("注册成功去登录吧->"),
                          ))
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
            height: 20,
          ),
          TextField(
            controller: usernameContrller,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: '用户名',
            ),
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            controller: emailController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: '邮箱',
            ),
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            controller: passwordController,
            obscureText: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: '密码',
            ),
          ),
          ElevatedButton(onPressed: signup, child: Text("注册")),
          ElevatedButton(
              onPressed: () => {Navigator.pop(context)}, child: Text("返回登录")),
        ],
      ),
    );
  }
}
