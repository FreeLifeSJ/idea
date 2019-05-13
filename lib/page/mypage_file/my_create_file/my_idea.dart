import 'package:flutter/material.dart';

class MyIdea extends StatefulWidget{

  @override
  State createState() {
    return MyIdeaState();
  }
}

class MyIdeaState extends State<MyIdea>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(child:Text("快去发布你的第一个想法吧"),);
  }
}