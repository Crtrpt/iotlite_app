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
    auth.postLogin({"account": account, "password": password}).then((value) => {
          if (value.code == 0)
            {}
          else
            {
              showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                        title: Text("提示"),
                        content: Text(value.msg),
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
            controller: accountContrller,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: '账号',
            ),
          ),
          TextField(
            controller: passwordController,
            obscureText: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: '密码',
            ),
          ),
          RaisedButton(onPressed: login, child: Text("登录")),
          RaisedButton(
              onPressed: () => {Navigator.pushNamed(context, "/signup")},
              child: Text("注册")),
          RaisedButton(
              onPressed: () => {Navigator.pushNamed(context, "/forget")},
              child: Text("找回密码"))
        ],
      ),
    );
  }
}
