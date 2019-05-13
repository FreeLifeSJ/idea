import 'package:flutter/material.dart';

class LivePage extends StatefulWidget {
  @override
  _LivePageState createState() => _LivePageState();
}

class _LivePageState extends State<LivePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('Live'),
      ),
      body: new ListView.builder(
        itemBuilder: (context, index) {
          return new ListTile(
            title: new Text('Welcome to Live ... 施工中'),
          );
        },
        itemCount: 20,
      ),
    );
  }
}