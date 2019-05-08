import 'package:flutter/material.dart';

class ChatMainPage extends StatefulWidget {
  @override
  _ChatMainPageState createState() => _ChatMainPageState();
}

class _ChatMainPageState extends State<ChatMainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("私信"),
      ),
      body: new Center(
        child: new Text("等待小哥开发"),
      ),
    );
  }
}