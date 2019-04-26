import 'package:flutter/material.dart';
import 'package:gaozhongzhihu/model/idea.dart';
import 'package:gaozhongzhihu/model/comtoanswer.dart';
import 'package:gaozhongzhihu/widgets/idea_item.dart';
import 'package:gaozhongzhihu/resources/resources_index.dart';
import 'package:gaozhongzhihu/widgets/comment_item.dart';

class IdeaScaffold extends StatefulWidget {
  final Idea model;
  IdeaScaffold({this.model,Key key}):super(key:key);
  @override
  _IdeaScaffoldState createState() => _IdeaScaffoldState();
}

class _IdeaScaffoldState extends State<IdeaScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("详情"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.list),
            //TODO:生成一个列表
            onPressed: (){print("生成一个列表");},
          )
        ],
      ),
      body: ListView(
        children: <Widget>[
          _buildTop(),
          Gaps.vGap10,
          _buildCommentList(),
        ],
      ),
     // bottomNavigationBar: _buildBottom(),
    );
  }
  //TODO:针对内容较多的想法在这里作出调整
  Widget _buildTop(){
    return IdeaItem(model: widget.model);
  }
  
  Widget _buildCommentList(){
    List<Com2ans> list = List<Com2ans>();
    for(int i=0;i<widget.model.comments_num;i++){
      Com2ans comment = Com2ans.IdeaComment(head_url: ideaHeadUrl[i],
          user_name: ideaUserName[i],content: commentContents[i]);
      list.add(comment);
    }
    List<CommentItem> listComment = List<CommentItem>();
    listComment = list.map((commentModel){
      return CommentItem(model: commentModel,);
    }).toList();
    List<Widget> listWidget = List<Widget>();
    Row row = Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(widget.model.comments_num.toString(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: Dimens.font_sp16),),
        Gaps.hGap3,
        Text("评论",style: TextStyle(fontWeight: FontWeight.bold,fontSize: Dimens.font_sp16),),
      ],
    );
    Divider divider = Divider(height: 0.33,color: Colours.dividerDark,);
    listWidget.add(row);
    listWidget.add(Gaps.vGap16);
    listWidget.add(divider);
    listWidget.addAll(listComment);
    return Container(
      padding: EdgeInsets.only(top: 16,right: 16,left: 16),
      decoration: BoxDecoration(color: Colors.white),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: listWidget,
      ),
    );
  }
//有问题
 /* Widget _buildBottom(){
    return BottomAppBar(
      child: Container(
        height: 50,
        child: Row(
          children: <Widget>[
            //TODO
            IconButton(
              icon: Icon(Icons.image,color: Colours.iconColorGrey,),
              onPressed: (){},
            ),
            //TODO
            IconButton(
              icon:Icon(Icons.tag_faces,color: Colours.iconColorGrey,),
              onPressed: (){},
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(
                      hintText: "请输入评论",
                    ),
                  ),
                  GestureDetector(
                    child: Container(
                      child: Text("发布"),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }*/
}
