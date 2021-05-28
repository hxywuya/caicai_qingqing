import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:qingqing_flutter/index.dart';
import 'package:qingqing_flutter/my.dart';
import 'package:qingqing_flutter/util/adapt.dart';

void main() {
  if (Platform.isAndroid) {
    SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
      builder: EasyLoading.init(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _currentIndex = 0;
  var navigationBarItems = [Index(), My()];

  @override
  Widget build(BuildContext context) {
    var bottomNavigationBarItems = <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: ImageIcon(AssetImage('images/home.png')),
        label: '购票',
      ),
      BottomNavigationBarItem(
        icon: ImageIcon(AssetImage('images/my.png')),
        label: '我的',
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        // title: Text(widget.title),
        backgroundColor: Color(0xffff3a8f),
        toolbarHeight: 0,
      ),
      body: navigationBarItems[_currentIndex], // This trailing comma makes auto-formatting nicer for build methods.
      bottomNavigationBar: BottomNavigationBar(
        items: bottomNavigationBarItems,
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        selectedFontSize: Adapt.px(22),
        unselectedFontSize: Adapt.px(22),
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        selectedItemColor: Color(0xFFFE3777),
        unselectedItemColor: Color(0xFF868686),
        showUnselectedLabels: true,
      ),
    );
  }
}
