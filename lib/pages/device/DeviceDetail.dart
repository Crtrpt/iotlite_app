import 'package:flutter/material.dart';

class DeviceDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(' 设备详情'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('启动页'),
          onPressed: () {
            // Navigate to the second screen when tapped.
          },
        ),
      ),
    );
  }
}
