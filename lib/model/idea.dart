import 'package:meta/meta.dart';

class Idea{
  int idea_id;
  int author_id;
  bool is_forward;
  String content;
  int img_num;
  //存放url的方式换成一个list
  String img1_url;
  String img2_url;
  String img3_url;
  String img4_url;
  String img5_url;
  String img6_url;
  String img7_url;
  String img8_url;
  String img9_url;
  int comments_num;
  int praise_num;
  int forwarded_num;
  var create_time; //这个该用什么类型呢？？
  //以下根据前端实际情况新增
  String user_name;
  String head_url;

  Idea({@required this.idea_id,this.author_id,this.content,@required this.user_name,
  this.comments_num=0,this.praise_num=0,this.forwarded_num,@required this.create_time,
  this.head_url});

  Idea.fromResource({this.head_url,this.user_name,this.content,this.praise_num,this.comments_num});

}
