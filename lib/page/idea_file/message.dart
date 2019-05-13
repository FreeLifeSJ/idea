import 'package:flutter/material.dart';

class MessagePage extends StatefulWidget{

  @override
  State createState() {
    return MessagePageState();
  }
}


class MessagePageState extends State<MessagePage>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("消息"),
      ),
      body: Center(
        child: Text("目前没有通知"),
      ),
    );
  }
}