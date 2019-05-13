import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:gaozhongzhihu/resources/storage_key.dart';
import 'package:flustars/flustars.dart';
import 'package:gaozhongzhihu/resources/resources_index.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:gaozhongzhihu/state_manange/redux.dart';

class NotificationSettingsPage extends StatefulWidget {
  @override
  State createState() => NotificationSettingsPageState();
}

class NotificationSettingsPageState extends State<NotificationSettingsPage> {
  bool isReceiveFstranger = false;
  bool isShowNumber = false;
  bool isShow1 = false;
  bool isShow2 = false;
  bool isShow3 = false;
  SharedPreferences sharedPreferences;
  @override
  Widget build(BuildContext context) {
    print("NotificationSettingsPage Build");
    return Scaffold(
      appBar: new AppBar(
        title: new Text("消息设置"),
      ),
      body: ListView(
        children: <Widget>[
          Card(
            margin: EdgeInsets.only(top: 10),
            elevation: 2,
            child: Column(
              children: <Widget>[
                ListTile(
                  title: Text("陌生人私信箱"),
                  subtitle: Text("开启后，与您互动较少的账号发来的私信将会进入陌生人私信箱"),
                  trailing: Switch(
                      value: isReceiveFstranger,
                      onChanged: (newValue) {
                        SpUtil.putBool(StorageKey.isSaveGPRS, newValue);
                        setState(() {
                          isReceiveFstranger = newValue;
                        });
                      }),
                ),
                Divider(
                  height: 0,
                  color: Colors.grey,
                  //indent: 100,
                ),
                ListTile(
                  title: Text("互动消息数字提醒"),
                  subtitle: Text("开启后，当产生互动通知私信时将进行数字提醒"),
                  trailing: Switch(
                      value: isShowNumber,
                      onChanged: (newValue) {
                        SpUtil.putBool(StorageKey.isSaveGPRS, newValue);
                        setState(() {
                          isShowNumber = newValue;
                        });
                      }),
                ),
                Divider(
                  height: 0,
                  color: Colors.grey,
                  //indent: 70,
                ),
                ListTile(
                  title: Text("关注的专栏有了新的回答"),
                  trailing: Switch(
                      value: isShow1,
                      onChanged: (newValue) {
                        SpUtil.putBool(StorageKey.isSaveGPRS, newValue);
                        setState(() {
                          isShow1 = newValue;
                        });
                      }),
                ),
                                Divider(
                  height: 0,
                  color: Colors.grey,
                  //indent: 70,
                ),
                ListTile(
                  title: Text("关注的人出版了新的电子书"),
                  trailing: Switch(
                      value: isShow2,
                      onChanged: (newValue) {
                        SpUtil.putBool(StorageKey.isSaveGPRS, newValue);
                        setState(() {
                          isShow2 = newValue;
                        });
                      }),
                ),
                                Divider(
                  height: 0,
                  color: Colors.grey,
                  //indent: 70,
                ),
                ListTile(
                  title: Text("我的礼券即将过期"),
                  trailing: Switch(
                      value: isShow3,
                      onChanged: (newValue) {
                        SpUtil.putBool(StorageKey.isSaveGPRS, newValue);
                        setState(() {
                          isShow3 = newValue;
                        });
                      }),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
