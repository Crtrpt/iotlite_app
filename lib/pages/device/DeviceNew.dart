import 'package:flutter/material.dart';

class DeviceNew extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('创建新设备'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('场景列表'),
          onPressed: () {
            // Navigate to the second screen when tapped.
          },
        ),
      ),
    );
  }
}
