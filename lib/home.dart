import 'package:zenzephyr/main.dart';
import 'package:zenzephyr/route.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  static const routeName = "/home";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
      ),
      body: Center(
        child: Text('This is the second page'), // Fixed the apostrophe here
      ),
    );
  }
}
