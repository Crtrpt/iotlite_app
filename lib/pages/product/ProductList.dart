import 'package:flutter/material.dart';
import 'package:iotlite/components/pagelist.dart';

class ProductList extends StatefulWidget {
  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: Text('产品列表'),
        actions: [
          PopupMenuButton<int>(
            onSelected: (idx) => {Navigator.pushNamed(context, "/product/new")},
            itemBuilder: (BuildContext context) => <PopupMenuEntry<int>>[
              const PopupMenuItem<int>(
                value: 1,
                child: Text('增加产品'),
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
                                Navigator.pushNamed(context, "/product/detail", arguments: {});
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
