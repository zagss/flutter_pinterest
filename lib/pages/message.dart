import 'package:flutter/material.dart';

class MessagePage extends StatefulWidget {

  @override
  _MessagePageState createState() => new _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('MEssage Page'),
        ),
        body: new Center(
          child: new ListView.builder(
            itemBuilder: (_, index) => new Text('painterestpainterpainterpainterpainterpainter'),
          ),
        )
      )
    );
  }
}