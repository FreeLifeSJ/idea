import 'package:flutter/material.dart';

class IdeaEditPage extends StatefulWidget{

  @override
  State createState() {
    return IdeaEditPageState();
  }
}

class IdeaEditPageState extends State<IdeaEditPage>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("想法"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.send),
            onPressed: (){
              print("");
            },
          )
        ],
      ),
    );
  }
}