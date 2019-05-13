import 'package:flutter/material.dart';
import 'package:gaozhongzhihu/resources/resources_index.dart';
import 'package:dio/dio.dart';
import 'package:flustars/flustars.dart';

class DynamicLogin extends StatefulWidget {
  @override
  _DynamicLoginState createState() => _DynamicLoginState();
}

class _DynamicLoginState extends State<DynamicLogin> {
  bool status = false;
  TextEditingController _phoneNumberController = TextEditingController();
  TextEditingController _securityCodeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("动态登录"),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody(){
    return Container(
      child: ListView(
        children: <Widget>[
          Row(
            children: <Widget>[
              Text("手机号"),
              Gaps.hGap10,
              Expanded(
                child: TextField(
                  controller: _phoneNumberController ,
                  decoration: InputDecoration(
                    hintText: "请输入手机号",
                  ),
                ),
              )
            ],
          ),
          Row(
            children: <Widget>[
              Text("验证码"),
              Gaps.hGap10,
              Expanded(
                child: TextField(
                  controller: _securityCodeController,
                  decoration: InputDecoration(
                    hintText: "请输入验证码",
                  ),
                ),
              ),
              RaisedButton(
                child: Text(status?"已发送":"发送验证码"),
                onPressed: (){
                  sendSVN();
                  setState(() {
                    status = true;
                  });
                },
              )
            ],
          ),
          Gaps.vGap15,
          Align(
            child: RaisedButton(
              onPressed: (){
                SpUtil.putBool(StorageKey.isLogin, true);
                Navigator.pushNamed(context, 'homepage');
              },
              child: Container(
                child: Text("登录"),
               alignment: Alignment.center,
               width: 80,
             ),
            ),
            alignment: Alignment.center,
          )
        ],
      ),
    );
  }

  void sendSVN() async{
    Dio dio  = new Dio();
    String url="http://kahula.cn/grh/smstest/sendsms.php";
    Response response = await dio.get(url,queryParameters: {"pnum":_phoneNumberController.text});
    print(response.data);
    if(response.data.toString().trim()==_securityCodeController.text.trim()){
      print("true");
    }
    print(_phoneNumberController.text);
  }
}
