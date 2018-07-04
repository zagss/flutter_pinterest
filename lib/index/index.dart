import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../global_config.dart';
import '../pages/home.dart';
import '../pages/search.dart';
import '../pages/message.dart';
import '../pages/me.dart';

class Index extends StatefulWidget {
  @override
  State<Index> createState() => new _IndexState();
}

class _IndexState extends State<Index> with TickerProviderStateMixin {
  int _tabIndex = 0;

  var tabImages;
  var _body;
  var appBarTitles = ['主页', '探索', '通知', '已收藏'];
  final tabTextStyleNormal = new TextStyle(color: const Color(0xff969696));
  final tabTextStyleSelected = new TextStyle(color: const Color(0xff555555));

  Image getTabImage(path) {
    return new Image.asset(path, width: 23.0, height: 23.0);
  }

  void initData() {
    if (tabImages == null) {
      tabImages = [
        [
          getTabImage('images/pinterest.png'),
          getTabImage('images/pinterest_active.png')
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
    _body = new IndexedStack(
      children: <Widget>[
        new HomePage(),
        new SearchPage(),
        new MessagePage(),
        new MePage()
      ],
      index: _tabIndex
    );
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
    final bottomNavigationBar = new CupertinoTabBar(
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
      ],
      currentIndex: _tabIndex,
      onTap: (index) {
        setState((){
          _tabIndex = index;
        });
      },
      backgroundColor: Color(0xfffffff),
    );

    return new MaterialApp(
      home: new Scaffold(
        body: _body,
        bottomNavigationBar: bottomNavigationBar,
      ),
    );
  }
}
