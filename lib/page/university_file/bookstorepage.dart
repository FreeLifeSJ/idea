import 'package:flutter/material.dart';

class BookStorePage extends StatefulWidget {
  @override
  _BookStorePageState createState() => _BookStorePageState();
}

class _BookStorePageState extends State<BookStorePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('BookStore'),
      ),
      body: new Center (
        child: new Text('Welcome to BookSotre ... 施工中'),
      )
    );
  }
}