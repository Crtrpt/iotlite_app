import 'package:flutter/material.dart';

class TcpClient extends StatefulWidget {
  @override
  _TcpServernState createState() => _TcpServernState();
}

class _TcpServernState extends State<TcpClient> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[Text("tcp 服务器")],
      ),
    );
  }
}
