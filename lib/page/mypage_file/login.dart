import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:gaozhongzhihu/resources/storage_key.dart';
import 'register.dart';
import 'package:gaozhongzhihu/resources/resources_index.dart';
import 'dynamic_login.dart';


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
        Align(
          //TODO
          alignment: Alignment.topRight,
          child: FlatButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>DynamicLogin()));
              },
              child: Text("动态登录"),
              textColor: Colors.blueAccent,
          ),
        ),
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
              },
            ),
            RaisedButton(
              child: Text("注册"),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>RegisterPage()));
              },
            )
          ],
        )
      ],
    );
  }

  void login() async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setBool(StorageKey.isLogin, true);
    String username = _userNameController.text;
    String password = _passwordController.text;
    print(username);
    print(password);
    Map<String,String> data = {"username":username,"password":password}; 
    String uri="http://kahula.cn/myzhihu_api/login/login.php";//不要忘记加上http
    try{
      //Response response = await dio.post(uri,data:{"username":username,"password":password});
     // Response response = await dio.request(uri,data: {"username":username,"password":password});
      Response response = await dio.get(uri,queryParameters: {"username":username,"password":password});
      //Response response = await dio.get(uri);
      print(response.data);
      print(response.statusCode);
      //TODO:
      if(response.statusCode==200){
        await sharedPreferences.setString(StorageKey.username, _userNameController.text);
        Navigator.pop(context);
      }
      //TODO:加上判断 状态码是OK的话将isLogin设置成true
      /*SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      await sharedPreferences.setBool(StorageKey.isLogin, true);*/
    }catch(e){
      print(e);
    }
  }

}