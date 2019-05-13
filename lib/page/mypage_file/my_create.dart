import 'package:flutter/material.dart';
import 'my_create_file/my_draft.dart';
import 'my_create_file/my_answer.dart';
import 'my_create_file/my_question.dart';
import 'my_create_file/my_idea.dart';

class MyCreatePage extends StatefulWidget{

  @override
  State createState() {
    return MyCreatePageState();
  }
}

class MyCreatePageState extends State<MyCreatePage> with SingleTickerProviderStateMixin{
  TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(initialIndex:0,length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("我的创作"),
        bottom: TabBar(
          indicatorColor: Colors.white,
          tabs: <Widget>[
            Text("草稿"),
            Text("回答"),
            Text("提问"),
            Text("想法")
          ],
          controller: _tabController,
        ),
      ),
      body: TabBarView(
          controller: _tabController,
          children:<Widget>[
            MyDraft(), //草稿
            MyAnswer(),
            MyQuestion(),
            MyIdea()
          ]
      ),
    );
  }
}
