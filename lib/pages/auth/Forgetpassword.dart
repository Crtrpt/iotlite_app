import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:iotlite/api/auth.dart';

class ForgetPassword extends StatefulWidget {
  @override
  _ForgetPasswordState createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  TextEditingController emailContrller = new TextEditingController();
  TextEditingController codeController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  @override
  void initState() {
    super.initState();
    print("初始化");
  }

  @override
  void dispose() {
    emailContrller.dispose();
    codeController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  verifEmail() {
    print("获取验证码");
    var email = emailContrller.value.text;
    auth.postVerifEmail({"email": email}).then((value) => {print("返回结果")});
  }

  find() {
    var email = emailContrller.value.text;
    var code = codeController.value.text;
    var password = passwordController.value.text;
    auth.postfind({
      "email": email,
      "code": code,
      "password": sha256.convert(utf8.encode(password)).toString()
    }).then((value) => {
          if (value["code"] == 0)
            {
              showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                        title: Text("提示"),
                        content: Text("重置成功 去登录吧->"),
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
            controller: emailContrller,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: '邮箱',
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(onPressed: verifEmail, child: Text("获取验证码")),
          SizedBox(
            height: 20,
          ),
          TextField(
            controller: codeController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: '验证码',
            ),
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            obscureText: true,
            controller: passwordController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: '密码',
            ),
          ),
          ElevatedButton(onPressed: find, child: Text("确认")),
          ElevatedButton(
              onPressed: () => {Navigator.pop(context)}, child: Text("返回登录")),
        ],
      ),
    );
  }
}
