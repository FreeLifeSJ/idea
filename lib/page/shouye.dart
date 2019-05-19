import 'package:flutter/material.dart';
import 'package:gaozhongzhihu/model/answer.dart';
import 'package:gaozhongzhihu/resources/resources_index.dart';
import 'package:gaozhongzhihu/widgets/shouye_item.dart';
import 'dart:convert';
import 'package:gaozhongzhihu/util/http.dart';
import 'package:dio/dio.dart';

class ShouYePage extends StatefulWidget{
  @override
  State<ShouYePage> createState() {
    // TODO: implement createState
    return ShouYePageState();
  }
}

class ShouYePageState extends State<ShouYePage> {
  List<Answer> list;
  List<ShouYeAnswerItem> listItem;
  List<ShouYeAnswerItem> lists;


  @override
  void initState() {
    getAnswers();
    print("initState");
    lists = list.map((model) {
      return ShouYeAnswerItem(model: model,);
    }).toList();
    listItem = List<ShouYeAnswerItem>();
    listItem.addAll(lists);
  }

  @override
  Widget build(BuildContext context) {
    print("build");

    // TODO: implement build
/*    return ListView.builder(
      itemCount: postTitleList.length,
      itemBuilder: (BuildContext context,int index){
        return MyListItem(index);
      },
    );*/
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: _refresh,
        child: ListView(
            children: listItem
        ),
      ),
    );
  }

  //TODO:实现从服务器获取answer实体列表的方法
  void getAnswers() {
    list = List<Answer>();
    for (int i = 0; i < 7; i++) {
      Answer answer = Answer.shouye(ans_id: i + 1,
          is_anonymous: false,
          question_content: questionContents[i],
          content_abstract: answerContents[i],
          praise_num: supportsnum[i],
          comments_num: commentsnum[i],
          head_url: headUrls[i],
          user_name: usernames[i],
          content: answerContents[i]);
      list.add(answer);
    }
  }

  Future<Null> _refresh() async {
/*    setState(() {
     // listItem.clear();
      listItem.add(item);
    });
    print("下拉刷新");
    print(answer.toString());*/

    /*await Future.delayed(Duration(seconds: 2), () {
      print('refresh');
      Map answerMap = json.decode(questionJson1);
      Answer answer = Answer.fromJson(answerMap);
      ShouYeAnswerItem item = ShouYeAnswerItem(model: answer, flag: 2);
      List<ShouYeAnswerItem> listTest = List<ShouYeAnswerItem>();
      setState(() {
        //listItem.clear();
        //listItem.addAll(listTest);
        listItem.addAll(lists);
        return null;
      });
    });*/
    print("下拉刷新");
    Response response;
    String uri = "http://kahula.cn/myzhihu_api/question/get/get.php";
    try{
      response = await dio.get(uri,queryParameters: {"pageNum":"1"});
    }catch(e){
      print(e);
    }
    //print(response.data);
    List list = json.decode(response.data);
    List<ShouYeAnswerItem> listTest = List<ShouYeAnswerItem>();
    for(int i=0;i<list.length;i++){
      Answer answer = Answer.fromJson(list[i]);
      var item = ShouYeAnswerItem(model: answer,);
      listTest.add(item);
    }
    setState(() {
      listItem.addAll(listTest);
    });
    print(listItem.length);
    //print(list[1]["question_id"]);
    return null;
  }
}



