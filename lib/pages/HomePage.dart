import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomePage> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  String dropdownValue = 'One';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
          child: ListView(padding: EdgeInsets.zero, children: <Widget>[
        SvgPicture.asset(
          'images/draw_bg.svg',
          fit: BoxFit.fill,
          height: 200,
        ),
        ListTile(
          title: Text('工具箱'),
          onTap: () {
            Navigator.pop(context);
            Navigator.pushNamed(context, "/tools");
          },
        ),
        ListTile(
          title: Text('用户设置'),
          onTap: () {
            Navigator.pop(context);
            Navigator.pushNamed(context, "/user/center");
          },
        ),
        ListTile(
          title: Text('系统设置'),
          onTap: () {
            Navigator.pop(context);
            Navigator.pushNamed(context, "/system/setting");
          },
        ),
        ListTile(
          title: Text('关于我们'),
          onTap: () {
            Navigator.pop(context);
            Navigator.pushNamed(context, "/system/setting");
          },
        ),
        ListTile(
          title: Text('退出'),
          onTap: () {
            Navigator.pop(context);
            Navigator.pushNamedAndRemoveUntil(context, "/login", (r) => false);
          },
        ),
      ])),
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text('首页'),
        actions: [
          PopupMenuButton<int>(
            onSelected: (i) => {
              if (i == 1) {Navigator.pushNamed(context, "/tool/wifi")} else if (i == 2) {Navigator.pushNamed(context, "/tool/scan")}
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<int>>[
              const PopupMenuItem<int>(
                value: 1,
                child: Text('设备配网'),
              ),
              const PopupMenuItem<int>(
                value: 2,
                child: Text('扫一扫'),
              ),
            ],
          )
        ],
      ),
      body: Text("首页内容"),
    );
  }
}
