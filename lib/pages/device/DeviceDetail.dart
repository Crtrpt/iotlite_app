import 'package:flutter/material.dart';

class DeviceDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(' 设备详情'),
        actions: [
          PopupMenuButton<int>(
            onSelected: (idx) {
              switch (idx) {
                case 0:
                  Navigator.pushNamed(context, "/device/model", arguments: {});
                  break;
                default:
                  print("未处理");
              }
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<int>>[
              PopupMenuItem<int>(
                value: 2,
                child: Text('设置'),
              ),
              PopupMenuItem<int>(
                value: 3,
                child: Text('删除'),
              )
            ],
          )
        ],
      ),
      body: GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4, mainAxisSpacing: 10.0, crossAxisSpacing: 10.0, childAspectRatio: 1.0),
          children: [Text("基本信息"), Text("设备控制"), Text("设备指标")]),
    );
  }
}
