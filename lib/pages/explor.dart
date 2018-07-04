import 'package:flutter/material.dart';
import '../global_config.dart';

class ExplorPage extends StatefulWidget {

  @override
  _ExplorPageState createState() => new _ExplorPageState();
}

class _ExplorPageState extends State<ExplorPage> {
  
  @override
  Widget build(BuildContext context) {
    return new Material(
      child: new Column(
        children: <Widget>[
          new MyAppBar(
            title: new Text('AppBar标题  flutter learning',
                style: Theme.of(context).primaryTextTheme.title),
          ),
          new Expanded(
              child: new Center(
            child: new Text('你好 世界！'),
          )),
        ],
      ),
    );
  }
}


class MyAppBar extends StatelessWidget {
  MyAppBar({this.title});

  final Widget title;

  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 80.0,
      padding: const EdgeInsets.only(top: 18.0),
      decoration: new BoxDecoration(color: Colors.white),
      child: new Row(
        children: <Widget>[
          new Expanded(
            child: new Container(
              height: 56.0,
              decoration: new BoxDecoration(
                color: GlobalConfig.searchBackgroundColor,
              ),
            )
          ),
          new IconButton(
            icon: new Icon(Icons.search),
            tooltip: '搜索',
            onPressed: null,
          )
        ],
      ),
    );
  }
}