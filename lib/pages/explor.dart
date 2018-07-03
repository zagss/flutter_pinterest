import 'package:flutter/material.dart';

class ExplorPage extends StatefulWidget {

  @override
  _ExplorPageState createState() => new _ExplorPageState();
}

class _ExplorPageState extends State<ExplorPage> {
  
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Explor Page'),
        ),
        body: new Center(
          child: new Text('Explor'),
        )
      )
    );
  }
}