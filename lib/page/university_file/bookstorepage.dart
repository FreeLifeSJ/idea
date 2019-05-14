import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:gaozhongzhihu/bai/model/book_model.dart';
import '../../widgets/bookview.dart';
import '../../bai/httpget/getbook.dart';


class BookStorePage extends StatefulWidget {
  @override
  _BookStorePageState createState() => _BookStorePageState();
}

class _BookStorePageState extends State<BookStorePage> {

    var dio_url = 'http://kahula.cn/grh/bookandlive/listen.php';
    String _result = 'success';
    List<BookModel> books = new List();
    Dio dio = new Dio();

    _getbook(int id) async {
    try {
      Response response = await dio.get(dio_url, queryParameters: {
        "order": "sbidb",
        "bi": id.toString(),
      });
      if (response.statusCode == HttpStatus.OK) {
        //decodebook(response.data);
        Map bookmap = json.decode(response.data);
        BookModel book = BookModel.fromJson(bookmap);
        books.add(book);
      } else {
        _result = 'error code : ${response.statusCode}';
      }
    } catch (exception) {
      print(exception);
      _result = '网络异常';
    }
    print('get book ${id} ${_result}');
  }

  _getData() async{
      for(int i = 1; i <=10; i++) {
        await _getbook(i);
      }
      setState(() {});
  }

    @override
  void initState() {
    _getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('知乎书店'),
      ),
      body: books.length == 0 ? new Center(child: new CircularProgressIndicator()):
      new ListView.builder(
        itemBuilder: (context, index) {
          return new BookView(
              book:  books[index],
          );
        },
        itemCount: 10,
      )
    );
  }
}