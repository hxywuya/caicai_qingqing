import 'package:flutter/material.dart';
import 'package:qingqing_flutter/util/adapt.dart';
import 'package:qingqing_flutter/util/network.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Index extends StatefulWidget {
  Index({Key? key}) : super(key: key);

  @override
  _IndexState createState() => _IndexState();
}

class _IndexState extends State<Index> {
  String topImage = '';
  AssetImage defaultTopImage = AssetImage('images/index/default_header.png');

  _IndexState() {
    init();
  }
  void init() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var indexPictures = prefs.getString('index_pictures');

    if (indexPictures != null) {
      setState(() {
        topImage = indexPictures;
      });
    }

    Network.api(
      '/common/option',
      params: {'name': 'show_pictures'},
      success: (data, response) {
        prefs.setString('index_pictures', data['index']);
        setState(() {
          topImage = data['index'];
        });
      }
    );
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Center(
      // Center is a layout widget. It takes a single child and positions it
      // in the middle of the parent.
      child: Column(
        children: <Widget>[
        topImage == '' ?
          Image(image: defaultTopImage, width: Adapt.px(750), height: Adapt.px(860), fit: BoxFit.cover) :
          Image.network(topImage, width: Adapt.px(750), height: Adapt.px(860), fit: BoxFit.cover),
          Container(
            margin: EdgeInsets.all(Adapt.px(40)),
            height: Adapt.px(110),
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [Color(0xFFFE3A9E), Color(0xFFFF3981), Color(0xFFFD3775)]),// 渐变色
                borderRadius: BorderRadius.circular(Adapt.px(60))
            ),
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.transparent),
                elevation: MaterialStateProperty.all(0),
              ),
              onPressed: init,
              child: Container(
                alignment: Alignment.center,
                // height: 50,
                child: Text('立即购票', style: TextStyle(color: Colors.white, fontSize: Adapt.px(46), fontWeight: FontWeight.bold),),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
