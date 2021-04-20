import 'package:flutter/material.dart';

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

  String dropdownValue = 'One';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
          child: ListView(padding: EdgeInsets.zero, children: <Widget>[
        DrawerHeader(
          child: Text('用户信息'),
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
        ),
        ListTile(
          title: Text('设置'),
          onTap: () {
            // Update the state of the app
            // ...
            // Then close the drawer
            Navigator.pop(context);
          },
        ),
        ListTile(
          title: Text('退出'),
          onTap: () {
            Navigator.pop(context);
            Navigator.pushNamed(context, "/login");
          },
        ),
      ])),
      appBar: AppBar(
        centerTitle: true,
        title: Text('首页'),
        actions: [
          PopupMenuButton<int>(
            itemBuilder: (BuildContext context) => <PopupMenuEntry<int>>[
              const PopupMenuItem<int>(
                value: 0,
                child: Text('增加场景'),
              ),
              const PopupMenuItem<int>(
                value: 1,
                child: Text('增加产品'),
              ),
              const PopupMenuItem<int>(
                value: 2,
                child: Text('设备配网'),
              ),
              const PopupMenuItem<int>(
                value: 3,
                child: Text('扫一扫'),
              ),
            ],
          )
        ],
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text('Map'),
          ),
          ListTile(
            title: Text('Album'),
          ),
          ListTile(
            title: Text('Phone'),
          ),
        ],
      ),
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
