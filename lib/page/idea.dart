import 'package:flutter/material.dart';

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
      children: <Widget>[
        _Idea(),
      ],

    );
  }

}


class _Idea extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                width: 50,
                height: 50,
                margin: EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(image:AssetImage("images/userimage.jpg"), )),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("FreeLife",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                    Text("三天前",style: TextStyle(color: Colors.grey),),
                  ],
                ),
              ),
              Icon(Icons.linear_scale),//怎样才能导入自己的图标
            ],
          ),
          Container(
            padding: EdgeInsets.only(left: 60),
            child: Text("大连的天气特别秀，快要春天了还下雪,我也是醉了"),
          ),
          //TODO 实现一个放置图片或视频的
          //底部菜单栏
          Container(
            padding: EdgeInsets.only(left: 60,top: 10),
            child:_IdeaBottom() ,
          )
        ],
      ),
    );
  }
}

class _IdeaBottom extends StatefulWidget{

  @override
  State createState() {
    return _IdeaBottomState();
  }
}

class _IdeaBottomState extends State<_IdeaBottom>{
  int thumbUpNum =4;
  bool isThumbUp = false;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        GestureDetector(
          onTap: (){
            print("转发");
          },
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(Icons.repeat),
              Text("转发")
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
              Icon(Icons.comment),
              Text("5"),
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
              Icon(Icons.thumb_up,color: isThumbUp?Colors.pink:Colors.grey,),
              Text(thumbUpNum.toString(),style: TextStyle(color:isThumbUp?Colors.pink:Colors.grey),),
            ],
          ),
        )
      ],
    );
  }
}