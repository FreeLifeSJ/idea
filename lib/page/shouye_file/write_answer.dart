import 'package:flutter/material.dart';


class WriteAnswerPage extends StatefulWidget{
  final String title;
  WriteAnswerPage(this.title);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return WriteAnswerPageState();
  }
}

class WriteAnswerPageState extends State<WriteAnswerPage>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title,overflow: TextOverflow.ellipsis,),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.send),
            onPressed: (){Navigator.of(context).pop();},
          )
        ],
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody(){
    return Container(
      padding: EdgeInsets.all(10),
      child: TextField(
        decoration: InputDecoration(
          hintText: "写回答...",
          border: InputBorder.none,
        ),
      ),
    );
  }

}