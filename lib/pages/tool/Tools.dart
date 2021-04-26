import 'package:flutter/material.dart';

class Tools extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('工具箱'),
        ),
        body: GridView(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                mainAxisSpacing: 2.0,
                crossAxisSpacing: 2.0,
                childAspectRatio: 1.0),
            children: [
              Text('Tcp服务器'),
              Text('Tcp客户端'),
              Text('Tcp服务器'),
              Text('Tcp客户端'),
              Text('MqttBroker'),
              Text('Mqtt客户端'),
              Text('Http服务器'),
              Text('http客户端'),
              Text('COAPBroker'),
              Text('coap客户端'),
              Text('wifi配网'),
              Text('扫一扫'),
            ]));
  }
}
