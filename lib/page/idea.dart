import 'package:flutter/material.dart';
import 'package:gaozhongzhihu/widgets/idea_item.dart';
import 'package:gaozhongzhihu/model/idea.dart';
import 'package:gaozhongzhihu/resources/resources_index.dart';

class IdeaPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: _buildBody(),
      floatingActionButton: FloatingActionButton(
        //这个浮动Button的样式还需要重新调整
          child: Icon(Icons.edit,),
          onPressed: (){
            Navigator.pushNamed(context, '/idea_edit');
          }),
    );
  }

  Widget _buildBody(){
    List<Idea> list = getIdeas();
    //这段代码有问题
    /*return Column(
      children: <Widget>[
        ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            Text("dddd"),
            Text("fffffffff"),
            Text("ggggggggggg"),
            Text("kkkkkkkk"),
            Text("llllllllllll"),
          ],
        ),
        Expanded(
          child:Text("uuuuuuuuuuu") ,
        ),
      ],
    );*/
    return ListView(
      //TODO:弄清楚这个方法的原理 map方法返回的是什么，为什么要用toList（）
      children: list.map((model){
        return IdeaItem(model: model);
      }).toList()
    );
  }

  List<Idea> getIdeas(){
    List<Idea> list = List<Idea>();
    for(int i=0;i<ideaUserName.length;i++){
      Idea idea = Idea.fromResource(user_name: ideaUserName[i],
        head_url: ideaHeadUrl[i],content: ideaContents[i],
        praise_num: ideaPraisesNum[i],comments_num: ideaCommentsNum[i]);
      list.add(idea);
    }
    return list;
  }

}

