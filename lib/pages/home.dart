import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Home Page'),
        ),
        body: new Center(
          child: new GestureDetector(
            child: new FlutterLogo(
              size: 200.0,
            ),
            onLongPress: () {
              print("tap");
            },
          )
        )
      )
    );
  }
}