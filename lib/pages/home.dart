import 'package:flutter/material.dart';
import '../global_config.dart';
import 'search.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Widget barSearch() {
    return new Container(
      child: new FlatButton(
        onPressed: (){
          Navigator.of(context).push(new MaterialPageRoute(
            builder: (context) {
              return new SearchPage();
            }
          ));
        },
        child: new Row(
          children: <Widget>[
            new Container(
              child: new Icon(Icons.search, size: 28.0, color: GlobalConfig.fontColor),
              margin: const EdgeInsets.only(right: 10.0),
            ),
            new Expanded(
              child: new Container(
                child: new Text("搜索", style: TextStyle(color: GlobalConfig.fontColor)),
              )
            ),
            new Container(
              child: new FlatButton(
                onPressed: (){},
                child: new Icon(Icons.photo_camera, size: 28.0, color: GlobalConfig.fontColor),
              ),
              width: 44.0,
            ),
          ],
        ),
      ),
      decoration: new BoxDecoration(
        borderRadius: const BorderRadius.all(const Radius.circular(4.0)),
        color: GlobalConfig.searchBackgroundColor,
      )
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: barSearch(),
          backgroundColor: Colors.white,
          elevation: 0.0
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
      ),
    );
  }
}