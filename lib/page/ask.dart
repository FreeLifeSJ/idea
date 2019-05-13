import 'package:flutter/material.dart';

class AskPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("提问"),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody(){
    return TextField(
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: "输入问题并以问号结尾"
      ),
    );
  }
}