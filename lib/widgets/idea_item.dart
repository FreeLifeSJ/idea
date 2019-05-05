import 'package:flutter/material.dart';
import 'package:gaozhongzhihu/model/idea.dart';
import 'package:gaozhongzhihu/resources/resources_index.dart';
import 'package:gaozhongzhihu/page/idea_file/ideaScaffold.dart';

//给另一个dart文件用 这里就不能定义成_IdeaItem了 不能定义成私有的了
class IdeaItem extends StatelessWidget{
  final Idea model;
  //是不是想法详情页
  final bool isDetail;
  IdeaItem({this.model,this.isDetail=false,Key key,}):super(key:key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      onTap: (){
        if(!isDetail){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>IdeaScaffold(model: model,)));
        }
       },
      child:Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(bottom: BorderSide(width: 0.33,color: Colours.dividerDark)),
        ),
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(right: 10),
                  child: CircleAvatar(
                    radius: 16,
                    backgroundImage: AssetImage(model.head_url),
                  ),
                  //这个方式实现会有空白
                  /*decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(image:AssetImage(model.head_url), )),*/
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(model.user_name,style:TextStyles.listTitle,),
                      Text("三天前",style: TextStyle(color: Colors.grey,fontSize: Dimens.font_sp12),),
                    ],
                  ),
                ),
                //TODO:导入自己的图标 举报按钮
                // Icon(Icons.linear_scale),//怎样才能导入自己的图标
              ],
            ),
            Gaps.vGap5,
            Container(
              padding: EdgeInsets.only(left: 42),
              child: Text(model.content),
            ),
            //TODO 实现一个放置图片或视频的
            //底部菜单栏
            Container(
              padding: EdgeInsets.only(left:10,top: 10),
              child:_IdeaBottom(model: model,) ,
            )
          ],
        ),
      ) ,
    );
  }
}

class _IdeaBottom extends StatefulWidget{
  final Idea model;
  _IdeaBottom({this.model,Key key}):super(key:key);
  @override
  State createState() {
    return _IdeaBottomState(thumbUpNum: model.praise_num);
  }
}

class _IdeaBottomState extends State<_IdeaBottom>{
  int thumbUpNum ;
  _IdeaBottomState({this.thumbUpNum});
  bool isThumbUp = false;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        GestureDetector(
          onTap: (){
            print("转发");
          },
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(Icons.repeat,color: Colors.grey.shade800,),
              Gaps.hGap3,
              Text("转发",style: TextStyle(color: Colors.grey.shade800),)
            ],
          ),
        ),
        GestureDetector(
          onTap: (){
            print("评论");
          },
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(Icons.comment,color: Colors.grey.shade600,),
              Gaps.hGap3,
              Text(widget.model.comments_num.toString()),
            ],
          ),
        ),
        GestureDetector(
          onTap: (){
            setState(() {
              if(isThumbUp){
                isThumbUp = false;
                thumbUpNum--;
              }else{
                isThumbUp = true;
                thumbUpNum++;
              }
            });
          },
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(Icons.thumb_up,color: isThumbUp?Colors.pink:Colors.grey.shade600,),
              Gaps.hGap3,
              Text(thumbUpNum.toString(),style: TextStyle(color:isThumbUp?Colors.pink:Colors.grey.shade600),),
            ],
          ),
        )
      ],
    );
  }
}