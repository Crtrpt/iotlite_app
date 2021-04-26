import 'package:flutter/material.dart';

class ScenesNew extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('创建新场景'),
      ),
      body: Stack(children: [
        // SvgPicture.asset(
        //   'images/bg.svg',
        //   height: MediaQuery.of(context).size.height,
        //   fit: BoxFit.cover,
        // ),
        ListView(
          padding: EdgeInsets.all(10),
          children: [
            // SizedBox(
            //   height: 300,
            // ),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: '名称',
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
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
