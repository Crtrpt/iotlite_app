import 'package:flutter/material.dart';

class Tools extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: Text('工具箱'),
        ),
        body: GridView(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4, mainAxisSpacing: 10.0, crossAxisSpacing: 10.0, childAspectRatio: 1.0), children: [
          InkWell(
              child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFffffff),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0),
                        offset: Offset(1, 1),
                        blurRadius: 0,
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  child: Center(
                    child: Text(
                      'Tcp客户端',
                      textAlign: TextAlign.center,
                    ),
                  )),
              onTap: () => {Navigator.pushNamed(context, "/tool/tcpserver")}),
          InkWell(
              child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFffffFF),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0),
                        offset: Offset(1, 1),
                        blurRadius: 0,
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  child: Center(
                    child: Text(
                      'Tcp服务器',
                      textAlign: TextAlign.center,
                    ),
                  )),
              onTap: () => {Navigator.pushNamed(context, "/tool/tcpserver")}),
        ]));
  }
}
