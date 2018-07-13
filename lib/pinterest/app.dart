import 'package:flutter/material.dart';

import '../pages/home.dart';
import '../pages/search.dart';
import '../pages/message.dart';
import '../pages/me.dart';

class PinterestApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Pinterest',
      theme: Theme.of(context),
      home: new PinterestScreen()
    );
  }
}

class PinterestScreen extends StatefulWidget {
  @override
  _PinterestScreenState createState() => new _PinterestScreenState();
}

class _PinterestScreenState extends State<PinterestScreen> with SingleTickerProviderStateMixin{
  int _tabIndex = 0;
  var tabImages;
  var _body;
  var appBarTitles = ['主页', '探索', '通知', '已收藏'];
  final tabTextStyleNormal = new TextStyle(color: const Color(0xff969696), fontSize: 10.0);
  final tabTextStyleSelected = new TextStyle(color: const Color(0xff555555), fontSize: 10.0);
  Image getTabImage(path) {
    return new Image.asset(path, width: 24.0, height: 24.0);
  }

  TabController _controller;
  VoidCallback onChanged;
  void initState() {
    super.initState();
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

    _body = new IndexedStack(
      children: <Widget>[
        new HomePage(),
        new SearchPage(),
        new MessagePage(),
        new MePage()
      ],
      index: _tabIndex
    );

    _controller = new TabController(initialIndex: _tabIndex, length: 4, vsync: this);
    onChanged = () {
      setState(() {
        _tabIndex = this._controller.index;
      });
    };
    _controller.addListener(onChanged);
  }

  @override
  void dispose() {
    _controller.removeListener(onChanged);
    _controller.dispose();
    super.dispose();
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

  Widget buildButtonColumn(int index) {
    return new Container(
      padding: new EdgeInsets.only(top: 8.0, bottom: 6.0),
      child: new Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          getTabIcon(index),
          new Container(
            margin: new EdgeInsets.only(top: 4.0),
            child: getTabTitle(index),
          )
        ],
      ),
    );
  }

  Widget _navigationBar() {
    return new IconTheme(
      data: new IconThemeData(color: Theme.of(context).accentColor),
      child: new Container(
        child: new TabBar(
          indicatorColor: Colors.transparent,
          indicatorWeight: 0.01,
          controller: _controller,
          labelColor: Colors.black,
          unselectedLabelColor: Colors.green,
          tabs: <Widget>[
            buildButtonColumn(0),
            buildButtonColumn(1),
            buildButtonColumn(2),
            buildButtonColumn(3),
          ],
        )
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      body: new Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          // new Flexible(
          //   child: new ListView.builder(
          //     itemBuilder: (_, index) => new Text('painter'),
          //   )
          // ),
          // new ListView.builder(
          //   itemBuilder: (_, index) => new Text('painterestpainterpainterpainterpainterpainter'),
          // ),
          new TabBarView(
            children: <Widget>[
              new HomePage(),
              new SearchPage(),
              new MessagePage(),
              new MePage()
            ],
            controller: _controller,
          ),
          new Container(
            // decoration: new BoxDecoration(
            //   color: Theme.of(context).cardColor,
            // ),
            height: 56.0,
            color: Theme.of(context).cardColor.withOpacity(0.96),
            child: _navigationBar(),
          )
        ],
      ),
      // bottomNavigationBar: new Stack(
      //   children: <Widget>[
      //     new Container(
      //       height: 56.0,
      //       color: Theme.of(context).cardColor.withOpacity(0.6),
      //       // decoration: new BoxDecoration(
      //       //   color: Theme.of(context).cardColor.withOpacity(0.6),
      //       // ),
      //       child: _navigationBar(),
      //     ),
      //   ],
      // )
    );
  }
}