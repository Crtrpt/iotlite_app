import 'package:flutter/material.dart';

class ScenesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        ListTile(
          title: Text('工厂'),
        ),
        ListTile(
          title: Text('农场'),
        ),
        ListTile(
          title: Text('智能家居'),
        ),
      ]),
    );
  }
}
