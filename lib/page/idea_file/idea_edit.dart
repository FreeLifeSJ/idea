import 'package:flutter/material.dart';
import 'package:gaozhongzhihu/resources/resources_index.dart';

class IdeaEditPage extends StatefulWidget{

  @override
  State createState() {
    return IdeaEditPageState();
  }
}

class IdeaEditPageState extends State<IdeaEditPage>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("想法"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.send),
            onPressed: (){
              print("向服务器传输想法数据");
              Navigator.of(context).pop();
            },
          )
        ],
      ),
      body: _buildBody(),
      bottomNavigationBar: _buildBottom(),
    );
  }

  Widget _buildBody(){
    return TextField(
      decoration: InputDecoration(
        hintText: "聊聊你的想法",
        //去掉下划线
        border: InputBorder.none,
      ),
    );
  }
//TODO:实现可以跟着键盘动的向上移动相应高度的效果
  Widget _buildBottom(){
    return BottomAppBar(
      child: Container(
        height: 45,
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(border: Border(right: BorderSide(color: Colours.dividerDark,width: 0.33))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.videocam,color:Colors.grey.shade700),
                    Gaps.hGap5,
                    Text("拍摄"),
                  ],
                ),
              )
            ),
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.image,color: Colors.grey.shade700,),
                  Gaps.hGap5,
                  Text("相册/视频")
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}