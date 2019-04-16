import 'package:meta/meta.dart';   //或material.dart都包括@required这个注解
//定义成包私有的？
//注意 dart的成员变量自带setter和getter方法
//怎么才能将这些创建实体的工作自动化
class User{
  int user_id;  //int存储空间是否够？
  String user_name;
  bool isVIP;   //和数据库的类型匹配问题  数据库是tinyint
  String password;
  bool sex;
  String head_url;
  int follower_num;  //用户关注的人数  变成following是不是语义性更强
  int followed_num; //关注该用户的人数
  String tele;
  String self_intro;
  String recent_scan_url;
  String chat_record_url;

  User({@required this.user_id,this.user_name,this.isVIP=false,this.sex,
  this.head_url,this.followed_num=0,this.follower_num=0, @required this.tele,this.self_intro,
  this.recent_scan_url,this.chat_record_url});
}