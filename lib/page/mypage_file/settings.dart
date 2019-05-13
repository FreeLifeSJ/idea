import 'package:flutter/material.dart';
import 'package:flustars/flustars.dart';
import 'package:gaozhongzhihu/resources/storage_key.dart';
import 'package:gaozhongzhihu/resources/resources_index.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:gaozhongzhihu/state_manange/redux.dart';

class SettingsPage extends StatefulWidget{

  @override
  State createState() {
    return SettingsPageState();
  }
}

class SettingsPageState extends State<SettingsPage>{
  //TODO:真正的设置成省流模式和自动下载更新  在服务器那边实现
  bool isAutoUpdate = false;
  bool isSaveGPRS = false;
  @override
  Widget build(BuildContext context) {
    isAutoUpdate = SpUtil.getBool(StorageKey.isAutoUpdate)??false;
    isSaveGPRS = SpUtil.getBool(StorageKey.isSaveGPRS)??false;
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("设置"),
      ),
      body: ListView(
        children: <Widget>[
         /* Padding(
            padding: EdgeInsets.only(top: 15,left: 15),
            child: Text("基本设置",
            style: TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.w500,
            ),
            textScaleFactor: 0.5,),
          ),*/
          StoreBuilder<IdeaState>(
            builder: (context,store){
              return ExpansionTile(
                title: Text("主题"),
                children: <Widget>[
                  Wrap(
                    children:themeColorMap.keys.map((String key){
                      Color value = themeColorMap[key];
                      return InkWell(
                        onTap: (){store.dispatch(RefreshColorAction(value));},
                        child: Container(
                          height: 36.0,
                          width: 36.0,
                          margin: EdgeInsets.all(5.0),
                          color: value,
                        ),
                      );
                    }).toList(),
                  )
                ],
              );
            },
          ),
          ListTile(
            title: Text("基本设置",
              style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.w800),
                textScaleFactor: 0.8,
            ),
          ),
          //TODO:设置成一个Slider
          ListTile(
            title: Text("字体大小"),
          ),
          ListTile(
            title: Text("省流量模式"),
            subtitle: Text("仅在Wi-Fi环境下才会自动加载图片"),
            trailing: Switch(value: isSaveGPRS, onChanged:(newValue){
              SpUtil.putBool(StorageKey.isSaveGPRS, newValue);
              setState(() {
                isSaveGPRS = newValue;
              });
                }),
          ),
          ListTile(
            title: Text("自动下载更新"),
            subtitle: Text("仅Wi-Fi下自动下载更新"),
            trailing: Switch(value: isAutoUpdate, onChanged: (newValue){
              SpUtil.putBool(StorageKey.isAutoUpdate, newValue);
              setState(() {
                isAutoUpdate = newValue;
              });}),
          ),
          ListTile(
            title: Text("帐号设置",
              style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.w800),
              textScaleFactor: 0.8,
            ),
          ),
          ListTile(
            title: Text("帐号与安全"),
            subtitle: Text("管理帐号安全，修改帐号密码等"),
          ),
          ListTile(
            title: Text("关于与帮助",
              style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.w800),
              textScaleFactor: 0.8,
            ),
          ),
          ListTile(
            title: Text("去评价"),
          ),
          ListTile(
            title: Text("检查更新"),
          ),
          Column(
            children: <Widget>[
              GestureDetector(
                onTap:_exit ,
                child: Padding(
                  padding: EdgeInsets.only(top: 10,bottom: 100),
                  child: Text("退出帐号",
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 17
                    ),),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  void _exit(){
    SpUtil.putBool(StorageKey.isLogin, false);
    Navigator.pop(context);  //用这句代码触发不了myPageUI的重新绘制
  }
}