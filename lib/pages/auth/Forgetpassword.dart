import 'package:flutter/material.dart';
import 'package:iotlite/api/auth.dart';

class ForgetPassword extends StatefulWidget {
  @override
  _ForgetPasswordState createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  TextEditingController accountContrller = new TextEditingController();
  TextEditingController codeController = new TextEditingController();
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
    codeController.dispose();
    super.dispose();
  }

  verifEmail() {
    var email = accountContrller.value.text;
    auth.postVerifEmail({"email": email}).then((value) => {print("返回结果")});
  }

  find() {
    var email = accountContrller.value.text;
    var code = codeController.value.text;
    auth.postfind({"email": email, "code": code}).then(
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
          SizedBox(
            height: 20,
          ),
          ElevatedButton(onPressed: () => verifEmail, child: Text("获取验证码")),
          SizedBox(
            height: 20,
          ),
          TextField(
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
