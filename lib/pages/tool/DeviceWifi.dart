import 'package:flutter/material.dart';

class DeviceWifi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text('设备配网'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('设备配网'),
          onPressed: () {
            // Navigate to the second screen when tapped.
          },
        ),
      ),
    );
  }
}
