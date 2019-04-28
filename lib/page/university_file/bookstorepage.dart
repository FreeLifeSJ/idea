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
          return
          new BookView(
            b_title: '失踪的孩子',
            b_author: '埃莱娜·费兰特', 
            b_summary: '《失踪的孩子》是“那不勒斯四部曲”的第四部，小说聚焦了莉拉和埃莱娜（“我”）的壮年和晚年，为她们持续...',
            b_cost: '62.00',
            b_grade: '9.2',
            b_view: '999+',
            );
        },
        itemCount: 10,
      )
    );
  }
}