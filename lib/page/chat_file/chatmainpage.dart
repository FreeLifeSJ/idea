import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'chat.dart';

class ChatMainPage extends StatefulWidget {
  @override
  _ChatMainPageState createState() => _ChatMainPageState();
}

class _ChatMainPageState extends State<ChatMainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: new Text("私信"),
        ),
        body: new ListView(
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            new GestureDetector(
              onTap: (){
                Navigator.pushNamed(context, '/chatzhihu');},
              child: new Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    width: 10,
                  ),
                  new Container(
                    margin: const EdgeInsets.only(right: 18.0),
                    child: new CircleAvatar(child: new Text('Z')),
                  ),
                  new Expanded(
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        new Text('知乎大学小管家',
                            style: Theme.of(context).textTheme.subhead),
                        new Container(
                          margin: const EdgeInsets.only(top: 6.0),
                          child: new Text('Hi~'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
