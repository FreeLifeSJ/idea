import 'package:flutter/material.dart';
import '../../widgets/bookview.dart';

class BookStorePage extends StatefulWidget {
  @override
  _BookStorePageState createState() => _BookStorePageState();
}

class _BookStorePageState extends State<BookStorePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('知乎书店'),
      ),
      body: new ListView.builder(
        itemBuilder: (context, index) {
          return new BookView();
        },
        itemCount: 10,
      )
    );
  }
}