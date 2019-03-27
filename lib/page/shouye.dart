import 'package:flutter/material.dart';
import 'package:gaozhongzhihu/const_resource.dart';

class ShouYePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.builder(
      itemCount: postTitleList.length,
      itemBuilder: (BuildContext context,int index){
        return MyListItem(index);
      },
    );
  }
}

class MyListItem extends StatelessWidget{
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
}

