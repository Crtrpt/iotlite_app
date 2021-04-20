import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('登录页'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('去注册'),
          onPressed: () {
            Navigator.pushNamed(context, "/signup");
          },
        ),
      ),
    );
  }
}
