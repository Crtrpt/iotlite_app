import 'package:flutter/material.dart';
import 'package:iotlite/components/pagelist.dart';

class DeviceList extends StatefulWidget {
  @override
  _DeviceListState createState() => _DeviceListState();
}

class _DeviceListState extends State<DeviceList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
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
      body: Column(children: [
        Expanded(
            child: Container(
                padding: EdgeInsets.all(10),
                child: PageList(
                    path: "/device/list",
                    data: {},
                    builder: (e) {
                      print(e);
                      return Container(
                          child: InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, "/device/detail", arguments: {});
                              },
                              child: Container(
                                padding: EdgeInsets.fromLTRB(0, 100, 100, 0),
                                child: Text("e11"),
                              )));
                    })))
      ]),
    );
  }
}
