import 'package:flutter/material.dart';
import 'package:gaozhongzhihu/model/comtoanswer.dart';
import 'package:gaozhongzhihu/resources/resources_index.dart';

class CommentItem extends StatelessWidget {
  final Com2ans model;
  CommentItem({this.model,Key key}):super(key:key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colours.dividerDark,width: 0.33))),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(right: 10),
            //alignment: Alignment.topLeft,
            child: CircleAvatar(
              radius: 15,
              //TODO:为什么AssetImage不可以 类型不匹配？？ child的话  而background这个属性又得AssetImage了
              backgroundImage: AssetImage(model.head_url),
            ),
          ),
          //TODO:这个Expanded是必须加的 否则绘制不出来 这是为什么？？
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(model.user_name,style: TextStyles.listTitle,),
                Gaps.vGap10,
                Text(model.content),
                Gaps.vGap15,
                Row(
                  children: <Widget>[
                    Expanded(
                      //TODO:换成动态时间
                      child: Text("三天前",style: TextStyles.listExtra,),
                    ),
                    Row(
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.comment,color:Colours.iconColorGrey ,),
                          onPressed: (){print("实现评论功能");},
                        ),
                        Gaps.hGap10,
                        IconButton(
                          icon: Icon(Icons.thumb_up,color: Colours.iconColorGrey,),
                          onPressed: (){print("实现点赞功能");},
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          )
        ],
    )
    );
  }
}
