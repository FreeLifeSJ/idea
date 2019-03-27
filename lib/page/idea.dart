import 'package:flutter/material.dart';

class IdeaPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: Text("想法模块待开发"),
      ),
      floatingActionButton: IconButton(
          icon: Icon(Icons.edit),
          onPressed: (){

          }),
    );
  }
}