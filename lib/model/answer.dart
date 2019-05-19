import 'package:meta/meta.dart';
//表示知乎首页中回答内容的一个实体
class Answer{
  //表中创建时间这个属性没有 以后再确定是否要加上
  int ans_id;  //还是要有的  点赞 收藏等等的时候还是要把这个id发给服务器的
  int question_id;
  int author_id;
  bool is_anonymous;
  String content;
  String praise_num;
  int thx_num;
  String comments_num;
  //以下属性并非数据表里的 根据移动端实际需要新增
  String image_url;
  String question_content;
  String head_url;
  String content_abstract; //回答摘要 在首页显示，首页内容不直接拉取回答具体内容
  String user_name;

  Answer.shouye({@required this.ans_id,@required this.is_anonymous,
  this.head_url,@required this.question_content,@required this.content_abstract,
  this.praise_num = "0", this.comments_num = "0",this.user_name,this.image_url,this.content});
  //实现获取用户头像的内容  这个功能放在哪里？？
  void getUserHeadImage(){}

  Answer.fromJson(Map<String,dynamic> json)
      : user_name = "yyh",
        head_url = "images/avatar4.jpg",
        question_content = json["title"],
        comments_num = json["comments_num"],
        praise_num = json["follower_num"],
        content_abstract = "暂无回答，等待您的精彩回答";

}