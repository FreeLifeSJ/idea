import 'package:flutter/material.dart';

class MyFavoritePage extends StatefulWidget{
  @override
  State createState() {
    return MyFavoritePageState();
  }
}

class MyFavoritePageState extends State<MyFavoritePage>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("我的收藏"),
      ),
      body: ListView(
        children: <Widget>[
          Card(
            margin: EdgeInsets.only(top: 15),
            elevation: 2,
            child: ListTile(
              title: Text("默认收藏"),
              subtitle: Text("0个内容"),
              trailing: Icon(Icons.lock),
            ),
          )
        ],
      ),
    );
  }
}