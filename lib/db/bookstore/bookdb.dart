import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

const String b_title = '失踪的孩子';
const String b_author = '埃莱娜·费兰特'; 
const String b_summary = '《失踪的孩子》是“那不勒斯四部曲”的第四部，小说聚焦了莉拉和埃莱娜（“我”）的壮年和晚年，为她们持续...';
const String b_cost = '62.00';
const String b_grade = '9.2';
const String b_view = '999+';

class DataTestPage extends StatefulWidget {
  @override
  _DataTestPageState createState() => _DataTestPageState();
}

class _DataTestPageState extends State<DataTestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('数据存储 学习'),
        centerTitle: true,
      ),
      body: new ListView(
        children: <Widget>[
          new Padding(
            padding: const EdgeInsets.only(
                top: 10.0, left: 10.0, bottom: 10.0, right: 10.0),
            child: new BooksDB(),
          ),
        ],
      ),
    );
  }
}

class BooksDB extends StatefulWidget {
  @override
  _BooksDBState createState() => _BooksDBState();
}

class _BooksDBState extends State<BooksDB> {
  String dbName = 'books.db';
  String dbPath;

  String sql_createTable = 
    'CREATE TABLE books_table ' 
    + '(id INTEGER PRIMARY KEY,'
    + 'title Text,'
    + 'author Text,'
    + 'summary Text,'
    + 'cost Text,'
    + 'grade Text,'
    + 'view Text)';

  String sql_query_count = 'SELECT COUNT(*) FROM books_table';
  String sql_query = 'SELECT * FROM books_table';

  var _result;

  ///建立数据库方法
  Future<String> _createNewDb(String dbName) async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    print(documentsDirectory);

    String path = join(documentsDirectory.path, dbName);

    if (await new Directory(dirname(path)).exists()) {
      await deleteDatabase(path);
    } else {
      try {
        await new Directory(dirname(path)).create(recursive: true);
      } catch (e) {
        print(e);
      }
    }
    return path;
  }

  _create() async {
    print(sql_createTable);
    dbPath = await _createNewDb(dbName);
    Database db = await openDatabase(dbPath);

    await db.execute(sql_createTable);
    await db.close();
    setState(() {
      _result = '创建db成功，创建table成功';
    });
  }

  _query() async {
    Database db = await openDatabase(dbPath);
    List<Map> list = await db.rawQuery(sql_query);
    await db.close();
    setState(() {
      _result = "数据详情：$list";
    });
  }

  _add() async {


    Database db = await openDatabase(dbPath);

    String sql =
        "INSERT INTO books_table(title,author,summary,cost,grade,view) VALUES('$b_title','$b_author','$b_summary','$b_cost','$b_grade','$b_view')";
    await db.transaction((txn) async {
      int id = await txn.rawInsert(sql);
    });

    await db.close();

    setState(() {
      _result = '插入数据成功';
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        new Padding(
          padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
          child: new Text('sqflite用法'),
        ),
        new Row(
          children: <Widget>[
            new RaisedButton(
                textColor: Colors.black,
                child: new Text('创建'),
                onPressed: _create),
            new RaisedButton(
                textColor: Colors.black, child: new Text('增'), onPressed: _add),
          ],
        ),
        new Row(
          children: <Widget>[
            new RaisedButton(
                textColor: Colors.black,
                child: new Text('查详情'),
                onPressed: _query),
          ],
        ),
        new Padding(
          padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
          child: new Text('结果：$_result'),
        ),
      ],
    );
  }
}