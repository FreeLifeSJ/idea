import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:gaozhongzhihu/resources/resources_index.dart';


class RegisterPage extends StatefulWidget{
  @override
  State createState() {
    return _RegisterPageState();
  }
}
class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _teleController = TextEditingController();
  final TextEditingController _introController = TextEditingController();
  final TextEditingController _businessController = TextEditingController();
  //是否勾选男复选框
  bool check = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("注册"),
      ),
      body:_buildBody() ,
    );
  }

  Widget _buildBody(){
    return Container(
      padding: EdgeInsets.all(16),
      child: ListView(
        children: <Widget>[
          _RegisterItem(iconData: Icons.person,labeltext: "用户名",isHaveTo: "必填",controller: _usernameController,),
          _RegisterItem(iconData: Icons.lock,labeltext: "密码",isHaveTo: "必填",controller: _passwordController,),
          _RegisterItem(iconData: Icons.phone,labeltext: "手机号",isHaveTo: "必填",controller:_teleController,),
          _buildCheckBoxRow(),
          _RegisterItem(iconData: Icons.assignment,labeltext: "个性签名",controller: _introController,),
          _RegisterItem(iconData: Icons.business,labeltext: "行业",controller: _businessController,),
          Gaps.vGap15,
          ButtonBar(
            alignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              FlatButton(
                color:Colors.grey.shade300 ,
                child: Text("清空"),
                onPressed: (){
                  _usernameController.clear();
                  _passwordController.clear();
                  _teleController.clear();
                  _introController.clear();
                  _businessController.clear();
                },
              ),
              RaisedButton(
                child: Text("提交"),
                onPressed: register,
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _buildCheckBoxRow(){
    return Container(
      child:Row(
        children: <Widget>[
          Icon(Icons.all_inclusive,color: Colours.iconColorGrey,),
          Gaps.hGap15,
          Expanded(
            child: Row(
              children: <Widget>[
                Checkbox(
                  //是否允许三态
                  tristate: false,
                  value:check ,
                  onChanged:(bool newValue){
                    setState(() {
                      check = !check;
                    });
                  },
                ),
                Gaps.hGap5,
                Text("男"),
                Gaps.hGap15,
                Checkbox(
                  tristate: false,
                  value: !check,
                  onChanged: (bool newValue){
                    setState(() {
                      check = !check;
                    });
                  },
                ),
                Gaps.hGap5,
                Text("女"),
              ],
            ),
          ),
          Gaps.hGap5,
          Text("必填"),
        ],
      ) ,
    );
  }

  Future register() async{
    Dio dio = Dio();
    String uri = "http://kahula.cn/myzhihu_api/signup/signup.php";
    String username = _usernameController.text.toString();
    String password = _passwordController.text.toString();
    String tele = _teleController.text.toString();
    String self_intro = _introController.text;
    String job = _businessController.text;
    String sex = check?'0':'1';
    Response response;
    try{
        response = await dio.get(uri,queryParameters: {"username":username,
        "password":password,"tele":tele,"sex":sex,"self_intro":self_intro,"job":job});
    }catch(e){
      print(e);
    }
    print(username);
    print(password);
    print(tele);
    print(sex);
    print(response.statusCode);
    print(response.data);
  }
}


class _RegisterItem extends StatefulWidget {
  final IconData iconData;
  final String labeltext;
  final String isHaveTo;
  final TextEditingController controller;
  _RegisterItem({@required this.iconData,@required this.labeltext, @required this.controller,this.isHaveTo = "选填"});
  @override
  _RegisterItemState createState() => _RegisterItemState();
}

class _RegisterItemState extends State<_RegisterItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 10),
      child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Icon(widget.iconData,color: Colours.iconColorGrey,),
        Gaps.hGap15,
        Expanded(
          child: TextField(
            controller: widget.controller,
            decoration: InputDecoration(
            labelText: widget.labeltext,
            ),
          ),
        ),
        Gaps.hGap5,
        Text(widget.isHaveTo),
        ],
      ),
    );
  }
}
