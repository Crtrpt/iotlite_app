import 'package:flutter/material.dart';

class UdpClient extends StatefulWidget {
  @override
  _TcpServernState createState() => _TcpServernState();
}

class _TcpServernState extends State<UdpClient> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[Text("udpclient")],
      ),
    );
  }
}
