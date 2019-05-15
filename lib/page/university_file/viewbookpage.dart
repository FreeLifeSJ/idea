import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:gaozhongzhihu/bai/model/book_model.dart';
import '../../widgets/bookview.dart';

// 查看某本书

class ViewBookPage extends StatefulWidget {
  final String isbn;

  ViewBookPage({Key key, this.isbn}) : super(key: key);

  @override
  _ViewBookPageState createState() {
    return _ViewBookPageState(
      isbn: isbn,
    );
  }
}

class _ViewBookPageState extends State<ViewBookPage> {

  final String isbn;

    _ViewBookPageState({this.isbn});

    var dio_url = 'http://kahula.cn/grh/bookandlive/listen.php';
    String _result = 'success';
    BookModel book = null;
    Dio dio = new Dio();

_getOneBook() async {
    try {
      Response response = await dio.get(dio_url, queryParameters: {
        "order": "sbidb",
        "bi": isbn,
      });
      if (response.statusCode == HttpStatus.OK) {
        //decodebook(response.data);
        Map bookmap = json.decode(response.data);
        book = BookModel.fromJson(bookmap);
        //books.add(book);
      } else {
        _result = 'error code : ${response.statusCode}';
      }
    } catch (exception) {
      print(exception);
      _result = '网络异常';
    }
    print('get book ${isbn} ${_result}');
    setState(() {});
  }
  @override
    void initState() {
    _getOneBook();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('书籍'),
      ),
      body: book == null ? new Center(child: new CircularProgressIndicator()):new BookDisplayZone(
        book: book,
      ),
    );
  }
}