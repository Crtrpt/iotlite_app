import 'package:flutter/material.dart';

class ScenesDetail extends StatefulWidget {
  @override
  _ScenesDetailState createState() => _ScenesDetailState();
}

class _ScenesDetailState extends State<ScenesDetail> {
  var query = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('场景详情'),
        actions: [
          PopupMenuButton<int>(
            onSelected: (idx) {
              switch (idx) {
                case 0:
                  Navigator.pushNamed(context, "/device/list", arguments: query);
                  break;
                case 1:
                  Navigator.pushNamed(context, "/device/new", arguments: query);
                  break;
              }
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<int>>[
              PopupMenuItem<int>(
                value: 0,
                child: Text('设备列表'),
              ),
              PopupMenuItem<int>(
                value: 1,
                child: Text('增加设备'),
              )
            ],
          )
        ],
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('场景详情'),
          onPressed: () {
            // Navigate to the second screen when tapped.
          },
        ),
      ),
    );
  }
}
