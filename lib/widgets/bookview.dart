import 'package:flutter/material.dart';
import '../style/gsy_style.dart';
import '../bai/model/book_model.dart';
import '../page/university_file/viewbookpage.dart';

class BookDisplayZone extends StatelessWidget {
  BookModel book;

  BookDisplayZone({@required this.book});

  ///返回书籍封面
  _getBookItem() {
    print(book.b_url);
    return new Row(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        // 预留封面
        new SizedBox(
          width: 200,
          height: 200,
          child: Image.network(book.b_url),
        ),
        Expanded(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Container(
                
                child: new Text(
                  book.b_title,
                  overflow: TextOverflow.clip,
                  style: new TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              new Container(
                width: 250.0,
                height: 25,
                child: new Text(
                  ' 作者：' + book.b_author,
                  // softWrap: false,
                  overflow: TextOverflow.clip,
                  style: new TextStyle(
                    fontSize: 16.0,
                    // fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new ListView(
        children: <Widget>[
          new Padding(
            padding: new EdgeInsets.only(
                left: 0.0, top: 10.0, right: 10.0, bottom: 10.0),
          ),
          // 封面
          new Container(
              child: _getBookItem(),
              margin: new EdgeInsets.only(top: 6.0, bottom: 2.0),
              alignment: Alignment.topLeft),
          Divider(
            height: 50,
            color: Colors.grey,
            //indent: 70,
          ),
          // 简介
          new Row(
            children: <Widget>[
              SizedBox(
                width: 20,
              ),
              Expanded(
                child: new Text(
                  ' 简介：' + book.b_summary,
                  // softWrap: false,
                  overflow: TextOverflow.clip,
                  style: new TextStyle(
                    fontSize: 16.0,
                    // fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
              ),
              SizedBox(
                width: 20,
              ),
            ],
          )
        ],
      ),
    );
  }
}

class BookView extends StatelessWidget {
  BookModel book;

  BookView({@required this.book});

  ///返回书籍卡片
  _getBookItem() {
    print(book.b_url);
    return new Row(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        // 预留封面
        new SizedBox(
          width: 100,
          height: 100,
          child: Image.network(book.b_url),
        ),
        Expanded(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Container(
                width: 250.0,
                height: 25.0,
                child: new Text(
                  ' 标题：' + book.b_title,
                  style: new TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              new Container(
                width: 250.0,
                height: 25,
                child: new Text(
                  ' 作者：' + book.b_author,
                  // softWrap: false,
                  overflow: TextOverflow.ellipsis,
                  style: new TextStyle(
                    fontSize: 12.0,
                    // fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
              ),
              new Container(
                width: 250.0,
                height: 25,
                child: new Text(
                  ' 简介：' + book.b_summary,
                  // softWrap: false,
                  overflow: TextOverflow.ellipsis,
                  style: new TextStyle(
                    fontSize: 12.0,
                    // fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  _getBottomItem(Color color, String text) {
    ///充满 Row 横向的布局
    return new Expanded(
      flex: 1,

      ///居中显示
      child: new Center(
        ///横向布局
        child: new Row(
          ///主轴居中,即是横向居中
          mainAxisAlignment: MainAxisAlignment.start,

          ///大小按照最大充满
          mainAxisSize: MainAxisSize.max,

          ///竖向也居中
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ///间隔
            //new Padding(padding: new EdgeInsets.all(5.0)),
            new Container(
              width: 100,
              child:

                  ///显示数量文本
                  new Text(
                text,
                style: new TextStyle(color: color, fontSize: 14.0),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      ///卡片包装
      child: new Card(

          ///增加点击效果
          child: new FlatButton(
              onPressed: () {
                // 显示书籍具体信息
                Navigator.push(context,
                    new MaterialPageRoute(builder: (BuildContext context) {
                  return new ViewBookPage(
                    isbn: book.isbn,
                  );
                }));
              },
              child: new Padding(
                padding: new EdgeInsets.only(
                    left: 0.0, top: 10.0, right: 10.0, bottom: 10.0),
                child: new Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ///文本描述
                    new Container(
                        child: _getBookItem(),
                        margin: new EdgeInsets.only(top: 6.0, bottom: 2.0),
                        alignment: Alignment.topLeft),
                    new Padding(padding: EdgeInsets.all(10.0)),

                    ///三个平均分配的横向图标文字
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      //crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        _getBottomItem(Colors.grey, '阅读：' + book.b_view),
                        _getBottomItem(Colors.grey, '评分：' + book.b_grade),
                        _getBottomItem(Colors.red, '价格：' + book.b_cost),
                      ],
                    ),
                  ],
                ),
              ))),
    );
  }
}
