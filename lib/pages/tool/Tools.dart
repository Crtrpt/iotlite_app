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
              InkWell(
                  child: Text('Tcp服务器'),
                  onTap: () =>
                      {Navigator.pushNamed(context, "/tool/tcpserver")}),
              InkWell(
                  child: Text('Tcp客户端'),
                  onTap: () =>
                      {Navigator.pushNamed(context, "/tool/tcpserver")}),
              InkWell(
                  child: Text('udp服务器'),
                  onTap: () =>
                      {Navigator.pushNamed(context, "/tool/udpserver")}),
              InkWell(
                  child: Text('udp客户端'),
                  onTap: () =>
                      {Navigator.pushNamed(context, "/tool/udpclient")}),
              InkWell(
                  child: Text('Wifi配网'),
                  onTap: () => {Navigator.pushNamed(context, "/tool/wifi")}),
              InkWell(
                  child: Text('扫一扫'),
                  onTap: () => {Navigator.pushNamed(context, "/tool/scan")}),
            ]));
  }
}
