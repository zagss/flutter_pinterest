import 'package:flutter/material.dart';

class Index extends StatefulWidget {
  @override
  State<Index> createState() => new _IndexState();
}

class _IndexState extends State<Index> with TickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        body: new Center(
          child: new Text('Painterest')
        ),
      )
    );
  }
}
