import 'package:flutter/material.dart';

class ScenesNew extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('创建新场景'),
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
