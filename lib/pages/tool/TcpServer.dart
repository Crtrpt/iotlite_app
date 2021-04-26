import 'package:flutter/material.dart';

class TcpServer extends StatefulWidget {
  @override
  _TcpServernState createState() => _TcpServernState();
}

class _TcpServernState extends State<TcpServer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[Text("tcp 服务器")],
      ),
    );
  }
}
