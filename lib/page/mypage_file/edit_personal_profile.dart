import 'package:flutter/material.dart';

class EditPersonalProfilePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("编辑个人资料"),
        leading: IconButton(
            icon:Icon(Icons.cancel) , onPressed: null),
      ),
    );
  }
}