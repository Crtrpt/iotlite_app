import 'package:flutter/material.dart';

class ProductNew extends StatelessWidget {
  TextEditingController nameTextEditingController = new TextEditingController();
  TextEditingController descTextEditingController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('创建新产品'),
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
            ElevatedButton(onPressed: save, child: Text("保存")),
          ],
        )
      ]),
    );
  }

  void save() {}
}
