import 'package:flutter/material.dart';

class DeviceList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('设备列表'),
        actions: [
          PopupMenuButton<int>(
            onSelected: (idx) => {Navigator.pushNamed(context, "/device/new")},
            itemBuilder: (BuildContext context) => <PopupMenuEntry<int>>[
              const PopupMenuItem<int>(
                value: 1,
                child: Text('增加设备'),
              )
            ],
          )
        ],
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Launch screen'),
          onPressed: () {
            // Navigate to the second screen when tapped.
          },
        ),
      ),
    );
  }
}
