import 'package:flutter/material.dart';
import '../global_config.dart';

class SearchPage extends StatefulWidget{
  @override
  SearchPageState createState() => new SearchPageState();
}

class SearchPageState extends State<SearchPage> {

  Widget searchInput() {
    return new Container(
      child: new Row(
        children: <Widget>[
          new Expanded(
            child: new Container(
              child: new TextField(
                autofocus: true,
                decoration: new InputDecoration.collapsed(
                  hintText: "搜索创意点子",
                  hintStyle: new TextStyle(color: GlobalConfig.fontColor),
                ),
                style: TextStyle(fontWeight: FontWeight.bold, color: GlobalConfig.fontColor, fontSize: 16.0),
              ),
              decoration: new BoxDecoration(
                color: GlobalConfig.searchBackgroundColor,
                borderRadius: const BorderRadius.all(const Radius.circular(4.0)),
              ),
              height: 36.0,
              margin: const EdgeInsets.only(right: 10.0),
              padding: const EdgeInsets.only(left: 10.0, top: 8.0),
            )
          ),
          new Container(
            margin: const EdgeInsets.only(right: 18.0),
            child: new CircleAvatar(
              radius: 20.0,
              child: new Icon(Icons.photo_camera, color: Colors.white),
              backgroundColor: GlobalConfig.fontColor,
            ),
          ),
          new GestureDetector(
            child: new Text(
              '取消',
              style: TextStyle(color: Color(0xff555555), fontSize: 14.0, fontWeight: FontWeight.bold),
            ),
            onTap: (){
              Navigator.of(context).pop();
            },
          )
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData(
        primaryColor: Colors.white,
      ),
      home: new Scaffold(
        appBar: new AppBar(
          title: searchInput(),
          elevation: 0.0
        ),
      )
    );
  }
}