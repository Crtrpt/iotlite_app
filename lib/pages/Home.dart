import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iotlite/components/pagelist.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  var routeList = ["/home", "/scenes", "/product", "/device", "/user/center"];

  void _onItemTapped(int index) {
    setState(() {
      // _selectedIndex = index;
      print("跳转" + routeList[index]);
      if (index != 0) {
        Navigator.pushNamed(context, routeList[index]);
      }
    });
  }

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
      body: Column(children: [
        Text("头部组件"),
        Expanded(
            child: Container(
                padding: EdgeInsets.all(10),
                child: PageList(
                    path: "111",
                    data: "",
                    builder: (e) {
                      print(e);
                      return Text(e);
                    })))
      ]),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            backgroundColor: Colors.blue,
            label: '首页',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: '场景',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: '设备',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '产品',
          )
        ],
      ),
    );
  }
}
