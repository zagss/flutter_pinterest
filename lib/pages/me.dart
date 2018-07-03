import 'package:flutter/material.dart';

class MePage extends StatefulWidget {

  @override
  _MePageState createState() => new _MePageState();
}

class _MePageState extends State<MePage> {
  
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('ME Page'),
        ),
        body: new Center(
          child: new Text('ME'),
        )
      )
    );
  }
}