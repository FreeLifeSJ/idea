import 'package:flutter/material.dart';
import 'package:gaozhongzhihu/model/answer.dart';
import 'package:gaozhongzhihu/resources/resources_index.dart';
import 'package:gaozhongzhihu/page/shouye_file/answer_scaffold.dart';
class ShouYeAnswerItem extends StatelessWidget {
  final Answer model;
  ShouYeAnswerItem({Key key,@required this.model,}):super(key:key);
  @override
  Widget build(BuildContext context) {
    //bool hidden = false;
/*    if(model.image_url==null){
      hidden = true;
    }*/
    return InkWell(
      onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>AnswerScafflod(model: model,)));},
      child: Card(
          margin: EdgeInsets.only(top: 10),
          child: Container(
            color: Colors.white,
            padding: EdgeInsets.all(16),
            //为什么让Column变成最小大小就都显示不出来了
            //TODO ：为什么150在模拟器就不行了
            height: 155,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  model.question_content,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyles.listTitle,
                ),
                Gaps.vGap5,
                Expanded(
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                CircleAvatar(
                                  radius: 11,
                                  //TODO:换成NetWorkImage
                                  backgroundImage: AssetImage(
                                    model.head_url,
                                  ),
                                ),
                                Gaps.hGap5,
                                Text(
                                  model.user_name,
                                  style: TextStyle(fontSize:Dimens.font_sp12,color: Colours.text_normal,fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            Gaps.vGap10,
                            Text(
                              model.content_abstract,
                              style: TextStyles.listContent,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                          ],
                        ),
                      ),
                      _buildContentImage(),
                    ],
                  ),
                ),
                Row(
                  children: <Widget>[
                    Text(
                      "${model.praise_num}赞同",
                      style: TextStyles.listExtra,
                    ),
                    Gaps.hGap15,
                    Text(
                      "${model.comments_num}评论",
                      style: TextStyles.listExtra,
                    )
                  ],
                )
              ],
            ),
          )
      ),
    );

  }

  Widget _buildContentImage(){
    if(model.image_url==null){
      return Container(width: 0,);
    }else{
      //TODO:服务器写好了再换成network
      return Image.asset(
              model.image_url,
              height: 80,
              width: 160,
              fit: BoxFit.fill,
          );

    }
  }


 /* Widget _build2(BuildContext context){
    return InkWell(
      onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>AnswerScafflod(model: model,)));},
      child: Card(
          margin: EdgeInsets.only(top: 10),
          child: Container(
            color: Colors.white,
            padding: EdgeInsets.all(16),
            //为什么让Column变成最小大小就都显示不出来了
            //TODO ：为什么150在模拟器就不行了
            height: 155,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  model.question_content,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyles.listTitle,
                ),
                Gaps.vGap5,
                Expanded(
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                CircleAvatar(
                                  radius: 11,
                                  //TODO:换成NetWorkImage
                                  backgroundImage: AssetImage(
                                    model.head_url,
                                  ),
                                ),
                                Gaps.hGap5,
                                Text(
                                  model.user_name,
                                  style: TextStyle(fontSize:Dimens.font_sp12,color: Colours.text_normal,fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            Gaps.vGap10,
                            Text(
                              "暂无回答，期待您的回答",
                              style: TextStyles.listContent,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                          ],
                        ),
                      ),
                     // _buildContentImage(),
                    ],
                  ),
                ),
              ],
            ),
          )
      ),
    );
  }*/
}
