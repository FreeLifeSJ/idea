import 'package:flutter/material.dart';

class InformPage extends StatefulWidget{

  @override
  State createState() {
    return _InformPageState();
  }
}

class _InformPageState extends State<InformPage>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView(
      //padding: EdgeInsets.symmetric(horizontal: 20),
      children: <Widget>[
        Card(
          elevation: 2,
          child:ListTile(
            leading: Icon(Icons.album,color: Colors.blue,),
            title: Text("私信",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18),),
            trailing: Icon(Icons.arrow_forward),
            onTap: (){
              Navigator.pushNamed(context, '/chat');
            },
          ) ,
        ),
        ListTile(
          title: Text("通知列表"),
          trailing: FlatButton(onPressed:(){print("全部已读");}, child: Text("全部已读")),
        ),
        //TODO 通知列表的List
       ListTile(
         leading: Icon(Icons.thumb_up,color: Colors.blue,),
         title: Text("赞同与感谢"),
         subtitle: Text("神啊精啊病吧感谢了回答"),
       )

      ],
    );
  }
}