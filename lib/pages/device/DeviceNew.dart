import 'package:flutter/material.dart';

import 'ProductSelect.dart';

class DeviceNew extends StatefulWidget {
  @override
  _DeviceNewState createState() => _DeviceNewState();
}

class _DeviceNewState extends State<DeviceNew> {
  TextEditingController nameTextEditingController = new TextEditingController();
  TextEditingController descTextEditingController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('创建新设备'),
        actions: [
          PopupMenuButton<int>(
            onSelected: (idx) {
              switch (idx) {
                case 0:
                  Navigator.pushNamed(context, "/tool/scan");
                  break;
              }
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<int>>[
              PopupMenuItem<int>(
                value: 0,
                child: Text('扫码创建'),
              ),
            ],
          )
        ],
      ),
      body: Stack(children: [
        ListView(
          padding: EdgeInsets.all(10),
          children: [
            // SizedBox(
            //   height: 300,
            // ),
            TextField(
              controller: nameTextEditingController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: '名称',
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: descTextEditingController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: '描述',
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) {
                        return new ProductSelect();
                      }));
                    },
                    child: Text("选择产品")),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(onPressed: save, child: Text("保存")),
          ],
        )
      ]),
    );
  }

  void save() {
    print("点击保存");
  }
}
