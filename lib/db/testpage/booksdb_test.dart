import 'dart:io';
import 'dart:async';

import 'package:flutter/material.dart';

/**
 * 数据库 书籍表 测试界面
 * 增删改查
 */

class BookDbTestPage extends StatefulWidget {
  @override
  _BookDbTestPageState createState() => _BookDbTestPageState();
}

class _BookDbTestPageState extends State<BookDbTestPage> {

  String b_title = '失踪的孩子';
  String b_author = '埃莱娜·费兰特'; 
  String b_summary = '《失踪的孩子》是“那不勒斯四部曲”的第四部，小说聚焦了莉拉和埃莱娜（“我”）的壮年和晚年，为她们持续...';
  String b_cost = '62.00';
  String b_grade = '9.2';
  String b_view = '999+';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('书籍表 测试界面'),
      ),
      body: ListView(
        children: <Widget>[
          
        ],
      ),
    );
  }
}