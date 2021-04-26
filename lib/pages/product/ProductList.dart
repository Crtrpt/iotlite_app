import 'package:flutter/material.dart';

class ProductList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      body: Center(
        child: ElevatedButton(
          child: Text('产品列表'),
          onPressed: () {
            // Navigate to the second screen when tapped.
          },
        ),
      ),
    );
  }
}
