import 'package:flutter/material.dart';
import 'index/index.dart';

void main() => runApp(new Pinterest());

class Pinterest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Pinterest',
      home: new Index(),
    );
  }
}
