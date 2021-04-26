import 'package:flutter/material.dart';

class SystemSetting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: Text('系统设置'),
        ),
        body: ListView(
          children: <Widget>[
            ListTile(
              title: Text('本地缓存'),
            ),
            ListTile(
              title: Text('自动配网'),
            ),
            ListTile(
              title: Text('设备发现'),
            ),
          ],
        ));
  }
}
