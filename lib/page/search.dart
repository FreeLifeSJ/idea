import 'package:flutter/material.dart';
import 'package:gaozhongzhihu/resources/resources_index.dart';

class SearchPage extends StatefulWidget{
  @override
  State createState(){
    return SearchPageState();
  }
}




class SearchPageState extends State<SearchPage>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
    );
  }
  
  Widget _buildAppBar(){
    return PreferredSize(
      preferredSize: Size.fromHeight(50),
      child: Container(
        margin:EdgeInsets.all(16),
        decoration: BoxDecoration(color: Colors.grey.shade100,borderRadius: BorderRadius.circular(5)),
        padding: EdgeInsets.symmetric(horizontal: 20),
        child:Row(
          children: <Widget>[
            IconButton(
              icon:Icon(Icons.arrow_back),
              onPressed: (){Navigator.pop(context);},
            ),
            Gaps.hGap15,
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: "搜索思想内容",
                ),
              ),
            )
          ],
        ) ,
      ),
    );
  }
}