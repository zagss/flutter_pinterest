import 'package:flutter/material.dart';
import '../global_config.dart';

class MePage extends StatefulWidget {
  MePage({Key key}) : super(key: key);

  @override
  _MePageState createState() => new _MePageState();
}

/// State for [MePage] widgets.
class _MePageState extends State<MePage> {
  final TextEditingController _controller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        new TextField(
          controller: _controller,
          decoration: new InputDecoration(
            hintText: 'Type something',
          ),
        ),
        new RaisedButton(
          onPressed: () {
            showDialog(
              context: context,
              child: new AlertDialog(
                title: new Text('What you typed'),
                content: new Text(_controller.text),
              ),
            );
          },
          child: new Text('DONE'),
        ),
      ],
    );
  }
}
