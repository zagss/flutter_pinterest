import 'package:flutter/material.dart';
import 'dart:convert';

class Index extends StatefulWidget {
  @override
  State<Index> createState() => new _IndexState();
}

class _IndexState extends State<Index> with TickerProviderStateMixin {
  int _tabIndex = 0;

  var tabImages;
  var appBarTitles = ['主页', '探索', '通知', '已收藏'];
  final tabTextStyleNormal = new TextStyle(color: const Color(0xff969696));
  final tabTextStyleSelected = new TextStyle(color: const Color(0xff63ca6c));

  Image getTabImage(path) {
    return new Image.asset(path, width: 20.0, height: 20.0);
  }

  void initData() {
    if (tabImages == null) {
      tabImages = [
        [
          getTabImage('images/painterest.png'),
          getTabImage('images/painterest_active.png')
        ],
        [
          getTabImage('images/explor.png'),
          getTabImage('images/explor_active.png')
        ],
        [
          getTabImage('images/message.png'),
          getTabImage('images/message_active.png')
        ],
        [
          getTabImage('images/me.png'),
          getTabImage('images/me_active.png')
        ]
      ];
    }
  }

  TextStyle getTabTextStyle(int curIndex) {
    if (curIndex == _tabIndex) {
      return tabTextStyleSelected;
    }
    return tabTextStyleNormal;
  }

  Image getTabIcon(int curIndex) {
    if (curIndex == _tabIndex) {
      return tabImages[curIndex][1];
    }
    return tabImages[curIndex][0];
  }

  Text getTabTitle(int curIndex) {
    return new Text(appBarTitles[curIndex], style: getTabTextStyle(curIndex));
  }

  @override
  Widget build(BuildContext context) {
    initData();
    final BottomNavigationBar bottomNavigationBar = new BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        new BottomNavigationBarItem(
          icon: getTabIcon(0),
          title: getTabTitle(0)
        ),
        new BottomNavigationBarItem(
          icon: getTabIcon(1),
          title: getTabTitle(1)
        ),
        new BottomNavigationBarItem(
          icon: getTabIcon(2),
          title: getTabTitle(2)
        ),
        new BottomNavigationBarItem(
          icon: getTabIcon(3),
          title: getTabTitle(3)
        ),
      ]
    );

    return new MaterialApp(
      home: new Scaffold(
        body: new Center(
          child: new Text('Painterest')
        ),
        bottomNavigationBar: bottomNavigationBar,
      )
    );
  }
}
