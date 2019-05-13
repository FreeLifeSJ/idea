import 'package:meta/meta.dart';
//对回答的评论类  其实现在想法也是用的这个类
class Com2ans{
  int com2ans_id;
  int author_id;
  int praise_num;
  int ans_id;
  String content;
  var create_time;
  //以下根据前端实际情况进行添加
  String user_name;
  String head_url;

  Com2ans({@required this.com2ans_id, this.author_id,this.praise_num=0,
  @required this.content,this.ans_id,@required this.create_time,
    @required this.user_name,@required this.head_url});

  Com2ans.IdeaComment({this.head_url,this.user_name,this.content});
}