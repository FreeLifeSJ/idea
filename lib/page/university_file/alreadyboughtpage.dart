import 'package:flutter/material.dart';

class ABPage extends StatefulWidget {
  @override
  _ABPagePageState createState() => _ABPagePageState();
}

class _ABPagePageState extends State<ABPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('已购内容'),
      ),
      body: new Center (
        child: new Text('Welcome to alreadyboughtpage ... 施工中'),
      )
    );
  }
}