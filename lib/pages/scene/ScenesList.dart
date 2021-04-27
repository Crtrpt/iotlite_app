import 'package:flutter/material.dart';
import 'package:iotlite/components/pagelist.dart';

class ScenesList extends StatefulWidget {
  @override
  _ScenesListState createState() => _ScenesListState();
}

class _ScenesListState extends State<ScenesList> {
  var query = {};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text('场景'),
        actions: [
          PopupMenuButton<int>(
            onSelected: (idx) => {Navigator.pushNamed(context, "/scenes/new")},
            itemBuilder: (BuildContext context) => <PopupMenuEntry<int>>[
              const PopupMenuItem<int>(
                value: 1,
                child: Text('增加场景'),
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
                    path: "/product/list",
                    data: {},
                    builder: (e) {
                      print(e);
                      return Container(
                          child: InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, "/scenes/detail", arguments: query);
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
