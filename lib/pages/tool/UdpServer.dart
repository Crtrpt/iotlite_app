import 'package:flutter/material.dart';

class UdpServer extends StatefulWidget {
  @override
  _TcpServernState createState() => _TcpServernState();
}

class _TcpServernState extends State<UdpServer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[Text("udp server 服务器")],
      ),
    );
  }
}
