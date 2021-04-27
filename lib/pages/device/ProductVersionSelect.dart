import 'package:flutter/material.dart';
import 'package:iotlite/components/pagelist.dart';

class ProductVersionSelect extends StatefulWidget {
  @override
  _DeviceNewState createState() => _DeviceNewState();
}

class _DeviceNewState extends State<ProductVersionSelect> {
  TextEditingController nameTextEditingController = new TextEditingController();
  TextEditingController descTextEditingController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('选择版本'),
        actions: [],
      ),
      body: Column(children: [
        Container(
          padding: EdgeInsets.all(10),
          child: TextField(
            controller: descTextEditingController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: '搜索',
            ),
          ),
        ),
        Expanded(
            child: Container(
                padding: EdgeInsets.all(10),
                child: PageList(
                    path: "/product/list",
                    data: {},
                    builder: (e) {
                      print(e);
                      return Container(
                          child: InkWell(
                              onTap: () {
                                Navigator.pop(context, -2);
                              },
                              child: Container(
                                padding: EdgeInsets.fromLTRB(0, 100, 100, 0),
                                child: Text("e11"),
                              )));
                    })))
      ]),
    );
  }

  void save() {
    print("点击保存");
  }
}
