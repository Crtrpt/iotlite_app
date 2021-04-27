import 'package:flutter/material.dart';
import 'package:iotlite/pages/device/DeviceList.dart';
import 'package:iotlite/pages/product/ProductList.dart';
import 'package:iotlite/pages/scene/ScenesList.dart';

import 'HomePage.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  var _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = new PageController(initialPage: 0);
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        onPageChanged: (idx) {
          setState(() {
            _selectedIndex = idx;
          });
        },
        controller: _pageController,
        children: [HomePage(), ScenesList(), ProductList(), DeviceList()],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: (idx) {
          _pageController.jumpToPage(idx);
          setState(() {
            _selectedIndex = idx;
          });
        },
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
