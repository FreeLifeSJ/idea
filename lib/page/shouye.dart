import 'package:flutter/material.dart';
import 'package:gaozhongzhihu/model/answer.dart';
import 'package:gaozhongzhihu/resources/resources_index.dart';
import 'package:gaozhongzhihu/widgets/shouye_item.dart';

class ShouYePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    List<Answer> list = getAnswers();
    // TODO: implement build
/*    return ListView.builder(
      itemCount: postTitleList.length,
      itemBuilder: (BuildContext context,int index){
        return MyListItem(index);
      },
    );*/
    return ListView(
      children: list.map((model){
        return ShouYeAnswerItem(model: model);
      }).toList(),
    );
  }
  //TODO:实现从服务器获取answer实体列表的方法
  List<Answer> getAnswers(){
    List<Answer> answers = List<Answer>();
    for(int i=0;i<7;i++){
      Answer answer =Answer.shouye(ans_id: i+1, is_anonymous: false,
          question_content:questionContents[i] , content_abstract: answerContents[i],
          praise_num: supportsnum[i],comments_num:commentsnum[i],head_url: headUrls[i],
          user_name: usernames[i],content: answerContents[i]);
      answers.add(answer);
    }
    return answers;
  }
}

/*class MyListItem extends StatelessWidget{
  int index;


  MyListItem(this.index);
   @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      margin: EdgeInsets.only(top: 10),
      child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment:CrossAxisAlignment.start,
            children: <Widget>[
              //其实可以把这些数据封装成对象  在实际连接网络开发的时候
              Text(postTitleList[index],maxLines: 2,style: TextStyle(fontWeight: FontWeight.bold),textAlign: TextAlign.left,),
              Text(postContentList[index],maxLines: 3,),
              Row(
                children: <Widget>[
                  Text("${postSupportNumber[index]}赞同"),
                  Text('${postCommentNumber[index]}评论'),
                  Icon(Icons.drag_handle),
                ],
              )
            ],
          ),
        )
    );

  }
}*/

