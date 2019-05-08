import 'package:flutter/material.dart';
import 'package:gaozhongzhihu/resources/resources_index.dart';
import 'package:gaozhongzhihu/model/answer.dart';
import 'write_answer.dart';

class AnswerScafflod extends StatelessWidget{
  final Answer model;
  AnswerScafflod({this.model,Key key}):super(key:key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed:(){Navigator.pushNamed(context, 'search');}
          ),
          IconButton(
            icon:Icon(Icons.list),
            onPressed: (){print("弹出列表");},
          )
        ],
      ),
      body:ListView(
        children: <Widget>[
          _buildTop(context),
          _buildCenter(),
        ],
      ) ,
      //TODO:弄明白bottomSheet和bottomNaviagtionBar属性值的区别  不能放底部导航是为什么了
     bottomNavigationBar: _buildBottomSheet(),
    );
  }

  Widget _buildTop(BuildContext context){
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(top: 16,left: 16,right: 16,),
      margin: EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          //TODO:这里把最大行数定成了2，不用maxLine解决问题太长放不下的时候
          Text(model.question_content,style: TextStyles.listTitle,maxLines: 2,overflow: TextOverflow.ellipsis,),
         // Gaps.vGap15,
          SizedBox(height: 20,),
          //TODO:添加点击事件
          Row(
            children: <Widget>[
              //TODO:多少这个值要传进来
              Text("查看全部多少回答",style: TextStyles.listContent,),
              Gaps.hGap5,
              Icon(Icons.arrow_forward_ios,size: 14,color: Colors.grey,),
            ],
          ),
          Gaps.vGap15,
          Divider(color: Colours.divider,height: 0.33,),
          Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(border: Border(right: BorderSide(color: Colours.divider,width: 0.33))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.person_add,color: Colors.blueAccent,),
                      Gaps.hGap5,
                      Text("邀请回答",style: TextStyles.blueBold,),
                      ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>WriteAnswerPage(model.question_content)));},
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.edit,color: Colors.blueAccent,),
                        Gaps.hGap5,
                        Text("写回答",style: TextStyles.blueBold,),
                      ],
                    ),
                  ),
                )
                ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildCenter(){
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child:Row(
                  children: <Widget>[
                    CircleAvatar(
                      radius: 20,
                      //TODO
                      backgroundImage: AssetImage(model.head_url),
                    ),
                    Gaps.hGap5,
                    Text(model.user_name,style: TextStyles.listTitle,)
                  ],
                ),
              ),
              GestureDetector(
                onTap: (){print("关注该用户");},
                child: Container(
                  margin: EdgeInsets.only(right: 5),
                  padding: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),color:Colors.grey.shade100, ),
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.add,color: Colors.blueAccent,size: 22,),
                      Text("关注",style: TextStyle(color: Colors.blueAccent,fontSize: 14,fontWeight: FontWeight.w600),),
                    ],
                  ),
                )
              ),
            ],
          ),
          SizedBox(height: 17,),
          Text(model.content)
        ],
      ),
    );
  }

  Widget _buildBottomSheet(){
    //加上一个BottomAppBar才好使，不然body的部分啥都显示不出来
    return BottomAppBar(
      child: Container(
        height: 60,
        padding: EdgeInsets.symmetric(horizontal: 16,vertical: 7),
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Row(
                children: <Widget>[
                  _BottomSheetItemLeft(),
                  Gaps.hGap5,
                  _BottomSheetItemLeft2(),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  _BottomSheetItem(iconData: Icons.favorite,str: "感谢",),
                  _BottomSheetItem(iconData: Icons.star,str: "收藏",),
                  _BottomSheetItem(iconData: Icons.comment,str: "评论",),
                ],
              ) ,
            ),

          ],
        ),
      ),
    );
  }
}


class _BottomSheetItem extends StatefulWidget {
  final IconData iconData;
  final String str;
  _BottomSheetItem({this.iconData,this.str});
  @override
  __BottomSheetItemState createState() => __BottomSheetItemState();
}

class __BottomSheetItemState extends State<_BottomSheetItem> {
  bool isTap = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        setState(() {
          if(isTap == false){
            isTap =true;
          }else{
            isTap = false;
          }
        });
      },
      child: Container(
        width: 40,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(widget.iconData,color: isTap?Colors.blueAccent:Colors.grey,),
            Text(isTap?"已${widget.str}":widget.str,
              style: TextStyle(fontSize: 12,color: isTap?Colors.blueAccent:Colors.grey),),
          ],
        ),
      )
    );
  }
}

class _BottomSheetItemLeft extends StatefulWidget {
  @override
  __BottomSheetItemLeftState createState() => __BottomSheetItemLeftState();
}

class __BottomSheetItemLeftState extends State<_BottomSheetItemLeft> {
  bool isTap = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        setState(() {
          if(isTap==false){
            isTap = true;
          }else{
            isTap = false;
          }
        });
      },
      child: Container(
        padding:EdgeInsets.symmetric(horizontal: 10,vertical: 5) ,
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          children: <Widget>[
            Icon(Icons.thumb_up,color:isTap?Colors.blueAccent:Colors.grey,size: 18,),
            Gaps.hGap5,
            Text(isTap?"已赞同":"赞同",
              style: TextStyle(color: isTap?Colors.blueAccent:Colors.grey),)
          ],
        ),
      ),
    );
  }
}

class _BottomSheetItemLeft2 extends StatefulWidget {
  @override
  __BottomSheetItemLeft2State createState() => __BottomSheetItemLeft2State();
}

class __BottomSheetItemLeft2State extends State<_BottomSheetItemLeft2> {
  bool isTap = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        setState(() {
          if(isTap==false){
            isTap = true;
          }else{
            isTap = false;
          }
        });
      },
      child: Container(
        padding:EdgeInsets.symmetric(horizontal: 5,vertical: 3.5) ,
        decoration: BoxDecoration(color: Colors.grey.shade100,borderRadius: BorderRadius.circular(5)),
        child: Icon(Icons.arrow_drop_down,color: isTap?Colors.blueAccent:Colors.grey,),
      ),
    );
  }
}


