class BookModel{

  final String b_title;
  final String b_author;
  final String b_summary;
  final String b_cost;
  final String b_grade;
  final String b_view;
  final String b_url;

  const BookModel({this.b_title,this.b_author,this.b_summary,this.b_cost,this.b_grade,this.b_view,this.b_url});

  BookModel.fromJson(Map<String, dynamic> json)
    :
      b_title=json['title'],
      b_author=json['author'],
      b_summary=json['intro'],
      b_cost=json['price'],
      b_grade=json['score'],
      b_view=json['rating_num'],
      b_url=json['cover_url']
  ;
}