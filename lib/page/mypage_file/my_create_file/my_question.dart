import 'package:flutter/material.dart';

class MyQuestion extends StatefulWidget{

  @override
  State createState() {
    return MyQuestionState();
  }
}

class MyQuestionState extends State<MyQuestion>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Text("去提问，让思维在碰撞中产生火花"),
    );
  }
}