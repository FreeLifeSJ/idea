import 'package:flutter/material.dart';
import 'package:flustars/flustars.dart';
import 'package:dio/dio.dart';
import 'package:gaozhongzhihu/util/http.dart';
import 'package:gaozhongzhihu/resources/resources_index.dart';
import 'dart:convert';

class AskPage extends StatefulWidget{
  @override
  State createState() => AskPageState();
}

class AskPageState extends State<AskPage>{
  TextEditingController _titleController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("提问"),
        actions: <Widget>[
          //todo
          IconButton(
            icon: Icon(Icons.send),
            onPressed: (){sendQuestion();},
          )
        ],
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody(){
    return TextField(
      controller: _titleController,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: "输入问题并以问号结尾"
      ),
    );
  }

  void sendQuestion() async{
    String  askStatus;
    String user_id = SpUtil.getString(StorageKey.user_id,defValue: null);
    String uri ="http://kahula.cn/myzhihu_api/question/push/push.php";
    Response response;
/*    Map<String,dynamic> question = <String,dynamic>{
      "userID":user_id,
      "title":_titleController.text,
    };
    String questionJson = json.encode(question);
    print(questionJson);*/
    //服务器的数据格式是FormData
    FormData formData = FormData.from({
      "userID":user_id,
      "title":_titleController.text,
    });
    try{
      response = await dio.post(uri,data: formData);
      print(response.data);
    }catch(e){
      print(e);
    }
    if(response.data=="true"){
      print("提问成功");
      askStatus = "提问成功";
    }else{
      print("提问失败");
      askStatus = "提问失败";
    }
    showDialog(
      context: context,
      builder: (BuildContext context){
        return SimpleDialog(
          children: <Widget>[
            Container(
              width: 60,
              height: 40,
              alignment: Alignment.center,
              child: Text(askStatus,style: TextStyles.listTitle,),
            ),
            Container(
              width: 60,
              height: 40,
              alignment: Alignment.bottomRight,
              child: FlatButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  child: Text("返回")
              ),
            )
          ],
        );
      }
    );
    _titleController.clear();
  }

}