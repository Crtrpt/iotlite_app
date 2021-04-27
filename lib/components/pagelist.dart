//分页加载 内容

import 'package:flutter/material.dart';

class PageList extends StatefulWidget {
  //请求的地址
  final path;

  final data;

  final Function builder;

  PageList({required String this.path, dynamic? this.data, required Function this.builder});

  @override
  _PageListState createState() => _PageListState(path: this.path, data: this.data, builder: this.builder);
}

class _PageListState extends State<PageList> {
  var list = ["222", "222", "333", "444", "555", "666", "777", "888", '999'];

  var _scrollController = ScrollController();

  var pagelist;

  var path;

  var data;

  Function builder;

  _PageListState({required String this.path, dynamic? this.data, required Function this.builder});

  @override
  void initState() {
    super.initState();
    _scrollController = new ScrollController(initialScrollOffset: 0, keepScrollOffset: true);
    _scrollController.addListener(() {
      // print("更新");
      print(_scrollController.offset);
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener(
        onNotification: (ScrollNotification notification) {
          // print("判断是否加载");
          if (notification.metrics.atEdge) {
            print("刷新 或者加载");
          }
          return true;
        },
        child: SingleChildScrollView(
          controller: _scrollController,
          scrollDirection: Axis.vertical,
          //true 滑动到底部
          reverse: false,
          physics: BouncingScrollPhysics(),
          child: Column(
            children: list.map((element) {
              return Row(
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: builder(element),
                  )
                ],
              );
            }).toList(),
          ),
        ));
  }
}
