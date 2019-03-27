import 'package:flutter/material.dart';

class NotificationSettingsPage extends StatefulWidget{

  @override
  State createState() {
    return NotificationSettingsPageState();
  }
}

class NotificationSettingsPageState extends State<NotificationSettingsPage>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("全局消息设置"),
      ),
      body: Center(
        child: Text("待开发"),
      ),
    );
  }
}