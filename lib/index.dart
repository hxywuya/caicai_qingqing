import 'package:flutter/material.dart';
import 'package:qingqing_flutter/util/network.dart';

class Index extends StatelessWidget {
  void hget() {
    Network.api(
      '/common/option',
      params: {'name': 'show_pictures'},
      // loading: '加载中',
      loading: true,
      success: (data, response) {
        print(data['buyTickets']);
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
        // Column is also a layout widget. It takes a list of children and
        // arranges them vertically. By default, it sizes itself to fit its
        // children horizontally, and tries to be as tall as its parent.
        //
        // Invoke "debug painting" (press "p" in the console, choose the
        // "Toggle Debug Paint" action from the Flutter Inspector in Android
        // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
        // to see the wireframe for each widget.
        //
        // Column has various properties to control how it sizes itself and
        // how it positions its children. Here we use mainAxisAlignment to
        // center the children vertically; the main axis here is the vertical
        // axis because Columns are vertical (the cross axis would be
        // horizontal).
        // mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image(image: AssetImage('images/index/default_header.png'), width: MediaQuery.of(context).size.width,),
          Container(
            margin: EdgeInsets.fromLTRB(30, 35, 30, 0),
            height: 60,
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [Color(0xFFFE3A9E), Color(0xFFFF3981), Color(0xFFFD3775)]),// 渐变色
              borderRadius: BorderRadius.circular(30)
            ),
            child: ElevatedButton(
              // shape: RoundedRectangleBorder(
              //     borderRadius: BorderRadius.circular(25)
              // ),
              // color: Colors.transparent, // 设为透明色
              // elevation: 0, // 正常时阴影隐藏
              // highlightElevation: 0, // 点击时阴影隐藏
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.transparent),
                elevation: MaterialStateProperty.all(0),
              ),
              onPressed: hget,
              child: Container(
                alignment: Alignment.center,
                // height: 50,
                child: Text('立即购票', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),),
              ),
            ),
          ),
          // ElevatedButton(
          //   // textColor: Color(0xFFFFFFFF),
          //   // color: Colors.blue,
          //   // highlightColor: Colors.blue[700],
          //   // colorBrightness: Brightness.dark,
          //   // splashColor: Colors.grey,
          //   child: Text("Submit"),
          //   // shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          //   onPressed: () {},
          // ),
        ],
      ),
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key? key, required this.title}) : super(key: key);
//
//   // This widget is the home page of your application. It is stateful, meaning
//   // that it has a State object (defined below) that contains fields that affect
//   // how it looks.
//
//   // This class is the configuration for the state. It holds the values (in this
//   // case the title) provided by the parent (in this case the App widget) and
//   // used by the build method of the State. Fields in a Widget subclass are
//   // always marked "final".
//
//   final String title;
//
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;
//   var _currentIndex = 0;
//
//   void _incrementCounter() {
//     setState(() {
//       // This call to setState tells the Flutter framework that something has
//       // changed in this State, which causes it to rerun the build method below
//       // so that the display can reflect the updated values. If we changed
//       // _counter without calling setState(), then the build method would not be
//       // called again, and so nothing would appear to happen.
//       _counter++;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     var bottomNavigationBarItems = <BottomNavigationBarItem>[
//       BottomNavigationBarItem(
//         icon: ImageIcon(AssetImage('images/home.png')),
//         label: '购票',
//       ),
//       BottomNavigationBarItem(
//         icon: ImageIcon(AssetImage('images/my.png')),
//         label: '我的',
//       ),
//     ];
//
//     // This method is rerun every time setState is called, for instance as done
//     // by the _incrementCounter method above.
//     //
//     // The Flutter framework has been optimized to make rerunning build methods
//     // fast, so that you can just rebuild anything that needs updating rather
//     // than having to individually change instances of widgets.
//     return Scaffold(
//       // appBar: AppBar(
//       //   // Here we take the value from the MyHomePage object that was created by
//       //   // the App.build method, and use it to set our appbar title.
//       //   title: Text(widget.title),
//       // ),
//       body: Center(
//         // Center is a layout widget. It takes a single child and positions it
//         // in the middle of the parent.
//         child: Column(
//           // Column is also a layout widget. It takes a list of children and
//           // arranges them vertically. By default, it sizes itself to fit its
//           // children horizontally, and tries to be as tall as its parent.
//           //
//           // Invoke "debug painting" (press "p" in the console, choose the
//           // "Toggle Debug Paint" action from the Flutter Inspector in Android
//           // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
//           // to see the wireframe for each widget.
//           //
//           // Column has various properties to control how it sizes itself and
//           // how it positions its children. Here we use mainAxisAlignment to
//           // center the children vertically; the main axis here is the vertical
//           // axis because Columns are vertical (the cross axis would be
//           // horizontal).
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme
//                   .of(context)
//                   .textTheme
//                   .headline4,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//       bottomNavigationBar: BottomNavigationBar(
//         // showUnselectedLabels:
//         // widget.type == BottomNavigationDemoType.withLabels,
//         items: bottomNavigationBarItems,
//         currentIndex: _currentIndex,
//         type: BottomNavigationBarType.fixed,
//         selectedFontSize: 12,
//         unselectedFontSize: 12,
//         onTap: (index) {
//           print('点击');
//           print(index);
//           print(_currentIndex);
//           setState(() {
//             _currentIndex = index;
//           });
//         },
//         selectedItemColor: Color(0xFFFE3777),
//         unselectedItemColor: Color(0xFF868686),
//         showUnselectedLabels: true,
//         // backgroundColor: Color(0xFFFE3777),
//       ),
//     );
//   }
// }
