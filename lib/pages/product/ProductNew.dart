import 'package:flutter/material.dart';

class ProductNew extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('创建新产品'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('场景列表'),
          onPressed: () {
            // Navigate to the second screen when tapped.
          },
        ),
      ),
    );
  }
}
