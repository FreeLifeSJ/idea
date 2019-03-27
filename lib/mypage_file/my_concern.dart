import 'package:flutter/material.dart';
import 'package:gaozhongzhihu/mypage_file/my_concern_file/concer_user.dart';
import 'package:gaozhongzhihu/mypage_file/my_concern_file/concern_question.dart';

class MyConcernPage extends StatefulWidget{

  @override
  State createState() {
    return MyConcernPageState();
  }
}

class MyConcernPageState extends State<MyConcernPage> with SingleTickerProviderStateMixin{
  TabController _tabController;
  void initState(){
    super.initState();
    _tabController  = TabController(initialIndex: 0,length: 4,vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("我的关注"),
        bottom:TabBar(
            tabs: <Widget>[
              Text("问题"),
              Text("用户"),
              Text("话题"),
              Text("专题")],
            indicatorColor: Colors.white,
            controller: _tabController,
            ),
      ),
      body: TabBarView(
          controller: _tabController,
          children:<Widget>[
            ConcernQuestionPage(),
            ConcernUserPage(),
            ConcernTopicPage(),
            ConcernSpecificTopicPage(),
          ]),
    );
  }
}


class ConcernTopicPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Text("话题部分待开发"),
    );
  }
}

class ConcernSpecificTopicPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Text("专题部分待开发"),
    );
  }
}