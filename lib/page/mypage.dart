import 'package:flutter/material.dart';

class MyPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView(
      children: <Widget>[
        Card(
          margin: EdgeInsets.only(top: 15),
          elevation: 2,
          child:ListTile(
            leading: Icon(Icons.person_pin,color: Colors.deepPurpleAccent,),
            title: Text("神棍骚猴"),
            subtitle: Text("修改个人资料"),
          )
        ),
        Card(
          margin: EdgeInsets.only(top: 10),
          elevation: 2,
          child: Column(
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.favorite,color: Colors.red,),
                title: Text("我的收藏"),
                onTap: (){
                  Navigator.pushNamed(context, '/my_favorite');
                },
              ),
              Divider(height:0,color: Colors.grey,indent: 70,),
              //怎么才能让分割线仅仅处于文字部分下方呢  即图标部分没有
              ListTile(
                leading: Icon(Icons.create,color: Colors.blueAccent,),
                title: Text("我的创作"),
                onTap: (){
                  Navigator.pushNamed(context, '/my_create');
                },
              ),
              Divider(color: Colors.grey,height: 0,indent: 70,),
              ListTile(
                leading: Icon(Icons.remove_red_eye,color: Colors.deepPurpleAccent,),
                title: Text("我的关注"),
                onTap: (){
                  Navigator.pushNamed(context, '/my_concern');
                },
              )
            ],
          ),
        ),
        Card(
          margin: EdgeInsets.only(top: 10),
          elevation: 2,
          child: Column(
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.shopping_basket,color: Colors.yellow,),
                title:Text("已购内容"),//这个是不是要删掉？和下面的Live和书店内容重合
              ),
              Divider(color: Colors.grey,height: 0,indent: 70,),
              ListTile(
                leading: Icon(Icons.flash_on,color: Colors.blue,),
                title: Text("我的Live"),
              ),
              Divider(color: Colors.grey,height: 0,indent: 70,),
              ListTile(
                leading: Icon(Icons.collections_bookmark,color:Colors.green),
                title: Text("我的书店"),
              ),
              Divider(color: Colors.grey,height: 0,indent: 70,),
              ListTile(
                leading: Icon(Icons.receipt,color: Colors.red,),
                title: Text("学习记录"),
              ),
              Divider(color: Colors.grey,height: 0,indent: 70,),
              ListTile(
                leading: Icon(Icons.beenhere,color: Colors.orange,),
                title: Text("我的VIP"),
              )
            ],
          ),
        ),
        Card(
          margin: EdgeInsets.only(top: 10,bottom: 40),
          elevation: 2,
          child: Column(
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.call_to_action,color: Colors.blueAccent,),
                title: Text("最近浏览"),
              ),
              Divider(color: Colors.grey,height: 0,indent: 70,),
              ListTile(
                leading: Icon(Icons.brightness_2,color: Colors.deepPurpleAccent,),
                title: Text("夜间模式"),
              ),
              Divider(color: Colors.grey,height: 0,indent: 70,),
              ListTile(
                leading: Icon(Icons.settings,color: Colors.grey,),
                title: Text("设置"),
                onTap: (){
                  Navigator.pushNamed(context, '/settings');
                },
              )
            ],
          ),
        )
      ],
    );
  }
}

/*
class CardItem extends StatelessWidget{
  final String text;
  final Image img;
  CardItem(this.text,this.img);

  Widget build(BuildContext context){
    return Row(
      children: <Widget>[
        Image(image: img),
        Text(text);
      ],
    )
  }
}*/
