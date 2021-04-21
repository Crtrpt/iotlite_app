import 'package:flutter/material.dart';
import 'package:iotlite/api/auth.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController accountContrller = new TextEditingController();

  TextEditingController passwordController = new TextEditingController();

  TextEditingController emailController = new TextEditingController();

  signup() {
    var account = accountContrller.value.text;
    var password = passwordController.value.text;
    var email = emailController.value.text;
    auth.postSign({
      "account": account,
      "password": password,
      "email": email
    }).then((value) => {print("返回结果")});
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
