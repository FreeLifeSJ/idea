import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

Dio dio = new Dio();  //在其他的文件里面能用吗？
class LoginPage extends StatefulWidget {
  @override
  State createState() {
    return LoginPageState();
  }
}

class LoginPageState extends State<LoginPage>{
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      body:_buildBody() ,
    );
  }

  Widget _buildBody(){
    return ListView(
      padding: EdgeInsets.all(16.0),
      children: <Widget>[
        SizedBox(height: 80,),
        Column(
          children: <Widget>[
            SizedBox(
              height: 66,
              child: Image.asset('assets/light.jpg'),
            ),
            SizedBox(height: 8,),
            Text("Idea")
          ],
        ),
        SizedBox(height: 90,),
        TextField(
          controller: _userNameController,
          decoration: InputDecoration(
            labelText: "帐号",
            filled: true,
          ),
        ),
        SizedBox(height: 15,),
        TextField(
          controller: _passwordController,
          decoration: InputDecoration(
            labelText: "密码",
            filled: true,
          ),
          obscureText: true,
        ),
        ButtonBar(
          children: <Widget>[
            RaisedButton(
              child: Text("登录"),
              onPressed: (){
                login();
                Navigator.pop(context);//为什么不需要传入
              },
            ),
            RaisedButton(
              child: Text("注册"),
              onPressed: (){
                print("需要编写向服务器传输数据的代码");
                register();
              },
            )
          ],
        )
      ],
    );
  }

  void login() async{
    String username = _userNameController.text;
    String password = _passwordController.text;
    print(username);
    print(password);
    Map<String,String> data = {"username":username,"password":password};
    String uri="";
    try{
      Response response = await dio.post(uri,data:data);
      print(response.statusCode);
    }catch(e){
      print(e);
    }
  }


  void register(){

  }
}