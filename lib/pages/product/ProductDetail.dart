import 'package:flutter/material.dart';

class ProductDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('产品'),
        actions: [
          PopupMenuButton<int>(
            onSelected: (idx) {
              switch (idx) {
                case 0:
                  Navigator.pushNamed(context, "/product/model", arguments: {});
                  break;
                default:
                  print("未处理");
              }
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<int>>[
              PopupMenuItem<int>(
                value: 0,
                child: Text('发布版本'),
              ),
              PopupMenuItem<int>(
                value: 0,
                child: Text('设备'),
              ),
              PopupMenuItem<int>(
                value: 1,
                child: Text('设备地图'),
              ),
              PopupMenuItem<int>(
                value: 2,
                child: Text('物模型'),
              ),
              PopupMenuItem<int>(
                value: 3,
                child: Text('历史版本'),
              ),
              PopupMenuItem<int>(
                value: 4,
                child: Text('设置'),
              ),
              PopupMenuItem<int>(
                value: 5,
                child: Text('删除'),
              )
            ],
          )
        ],
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('产品的详细信息'),
          onPressed: () {
            // Navigate to the second screen when tapped.
          },
        ),
      ),
    );
  }
}
