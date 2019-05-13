import 'package:flutter/material.dart';

class StudyLogPage extends StatefulWidget {
  @override
  _StudyLogPageState createState() => _StudyLogPageState();
}

class _StudyLogPageState extends State<StudyLogPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('学习记录'),
      ),
      body: new Center (
        child: new Text('Welcome to StudyLogPage ... 施工中'),
      )
    );
  }
}