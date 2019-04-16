import 'package:meta/meta.dart';
class Question{
  int question_id;
  int author_id;
  bool is_anonymous;
  String topics;
  String title;
  String content;
  int answer_num;
  int comments_num;
  int follower_num;  //这个语义性和user的follower的语义性又不一样了
  //后续可能还要做一些优化
  Question({@required this.question_id,this.author_id,this.is_anonymous,
      this.comments_num=0,this.follower_num=0,@required this.title,
  this.content,this.answer_num=0});
}