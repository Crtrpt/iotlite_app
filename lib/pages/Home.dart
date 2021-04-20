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
      _selectedIndex = index;
      print("跳转" + routeList[index]);
      if (index != 0) {
        Navigator.pushNamed(context, routeList[index]);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('首页'),
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
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '我的',
          ),
        ],
      ),
    );
  }
}
