import 'package:flutter/material.dart';
import 'package:iotlite/api/auth.dart';

class ForgetPassword extends StatefulWidget {
  @override
  _ForgetPasswordState createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
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

  verifEmail() {
    var account = accountContrller.value.text;
    var password = passwordController.value.text;
    auth.postLogin({"account": account, "password": password}).then(
        (value) => {print("返回结果")});
  }

  find() {
    var account = accountContrller.value.text;
    var password = passwordController.value.text;
    auth.postLogin({"account": account, "password": password}).then(
        (value) => {if (value.code == 0) {}});
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
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: '邮箱',
            ),
          ),
          RaisedButton(onPressed: () => verifEmail, child: Text("获取验证码")),
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: '验证码',
            ),
          ),
          TextField(
            obscureText: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: '密码',
            ),
          ),
          RaisedButton(onPressed: find, child: Text("确认")),
          RaisedButton(
              onPressed: () => {Navigator.pop(context)}, child: Text("返回登录")),
        ],
      ),
    );
  }
}
