import 'package:flutter/material.dart';

import 'package:xml/xml.dart' as xml;
import 'package:http/http.dart' as http;
import 'dart:async';

import 'Pages/aa.dart';
import 'Pages/myinfo.dart';
import 'Pages/pic.dart';

import 'kane_page.dart';

import 'package:flutter/services.dart';

import 'Pages/study.dart';

int yanderePage = 1 ;

///yandere
final String yanderexml = 'https://yande.re/post.xml?page=$yanderePage';
List<String> yandere15preview;
List<String> yandere20smaple;
List<String> yandere24jpeg;
List<String> yandere27jpegsize;
List<String> yandere11filesize;

///Danbooru
final String danbooruxml = "https://danbooru.donmai.us/posts.xml";
List<String> danboorupreview;
final String danbooruxmls = "https://safebooru.donmai.us/posts.xml";
List<String> safeboorupreview;

final String testxml = 'https://yande.re/post.xml?tags=tokisaki_kurumi';
List<String> testlist;

int setcount = 2;

const platform = const MethodChannel('samples.flutter.io/downloadimage');

void downloadImage(String url) {
  platform.invokeMethod('downloadImage', url);
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<NavigationIconView> _navigationViews;
  int _currentIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getyandere();
    getdanbooru();
    getdanboorus();
  }

  /// yandere api
  Future<String> getyandere() async {
    http.Response response1 = await http.get(
      Uri.encodeFull(yanderexml),
    );
    setState(() {
      var keys1 = xml.parse(response1.body).findAllElements('post');
      yandere15preview = keys1.map((node) {
        return node.attributes[15].value;
      }).toList();
      yandere20smaple = keys1.map((node) {
        return node.attributes[20].value;
      }).toList();
      yandere24jpeg = keys1.map((node) {
        return node.attributes[24].value;
      }).toList();
      yandere27jpegsize = keys1.map((node) {
        return node.attributes[27].value;
      }).toList();
      yandere11filesize = keys1.map((node) {
        return node.attributes[11].value;
      }).toList();
    });
    return 'Success!!';
  }

  /// danbooru api
  Future<String> getdanbooru() async {
    http.Response response3 = await http.get(
      Uri.encodeFull(danbooruxml),
    );
    setState(() {
      var keys3 = xml.parse(response3.body).findAllElements('preview-file-url');
      danboorupreview = keys3.map((node) {
        return node.text;
      }).toList();
    });
    return 'Success!!';
  }
  /// danbooru api
  Future<String> getdanboorus() async {
    http.Response response3 = await http.get(
      Uri.encodeFull(danbooruxmls),
    );
    setState(() {
      var keys3 = xml.parse(response3.body).findAllElements('preview-file-url');
      safeboorupreview = keys3.map((node) {
        return node.text;
      }).toList();
    });
    return 'Success!!';
  }

  @override
  Widget build(BuildContext context) {
    _navigationViews = <NavigationIconView>[
      new NavigationIconView(
        icon: const Icon(Icons.image),
        title: 'yandere',
        color: Colors.redAccent,
      ),
      new NavigationIconView(
        icon: const Icon(Icons.image),
        title: 'Danbooru',
        color: Colors.blue,
      ),
      new NavigationIconView(
        icon: const Icon(Icons.image),
        title: '学习',
        color: Colors.pinkAccent,
      ),
      new NavigationIconView(
        icon: const Icon(Icons.image),
        title: '我的',
        color: Colors.orangeAccent,
      ),
    ];
    List<String> _titles = ['yande.re', 'danbooru.donmai.us', '学习页面','个人信息'];
    List<Color> _colors = [
      Colors.redAccent,
      Colors.blue,
      Colors.pinkAccent,
      Colors.orangeAccent,
    ];

    final BottomNavigationBar botNavBar = new BottomNavigationBar(
      ///底部图标颜色
      fixedColor: _colors[_currentIndex],
      items: _navigationViews
          .map((NavigationIconView navigationIconView) =>
              navigationIconView.item)
          .toList(),
      currentIndex: _currentIndex,
      onTap: (int index) {
        setState(() {
          _currentIndex = index;
        });
      },
    );

    return new Scaffold(
      appBar: new PreferredSize(
        preferredSize: new Size(10.0, 50.0),
        child: new AppBar(
          ///column按钮
          // leading: IconButton(
          //   icon: Icon(Icons.view_column),
          //   onPressed: () {
          //     showModalBottomSheet<void>(
          //         context: context,
          //         builder: (BuildContext context) {
          //           return Container(
          //             height: 60.0,
          //             child: new Row(children: <Widget>[
          //               Expanded(
          //                 child: new IconButton(
          //                   icon: Icon(Icons.view_week),
          //                   onPressed: () {
          //                     setState(() {
          //                       setcount < 10 ? setcount++ : setcount;
          //                     });
          //                   },
          //                 ),
          //               ),
          //               Expanded(
          //                 child: new IconButton(
          //                   icon: Icon(Icons.pause),
          //                   onPressed: () {
          //                     setState(() {
          //                       setcount > 2 ? setcount-- : setcount;
          //                     });
          //                   },
          //                 ),
          //               ),
          //             ]),
          //           );
          //         });
          //   },
          // ),

          actions: <Widget>[
            /// 支持 按钮
            IconButton(
                onPressed: () {
                  Navigator.of(context).push(new MaterialPageRoute(
                      builder: (BuildContext context) => new KanePage()));
                },
                icon: Icon(Icons.extension)),
          ],

          automaticallyImplyLeading: true,
          title: new Text('${_titles[_currentIndex]}'),
          centerTitle: true,

          ///顶部AppBar颜色
          backgroundColor: _colors[_currentIndex],
        ),
      ),
      bottomNavigationBar: botNavBar,
      body: new Builder(
        builder: (BuildContext context) {
          switch (_currentIndex) {
            case 0:
              return yandere();
              break;
            case 1:
              return aa(context);
              break;
            case 2:
              return study(context);
              break;
            case 3:
              return myinfo(context);
              break;
            default:
              return new Center(
                child: new Text(
                  '页面不见了',
                  style: new TextStyle(fontSize: 30.0, color: Colors.red),
                ),
              );
          }
        },
      ),
    );
  }
}

///导航按钮
class NavigationIconView {
  NavigationIconView({
    Widget icon,
    String title,
    Color color,
  })  : _icon = icon,
        _color = color,
        _title = title,
        item = new BottomNavigationBarItem(
          icon: icon,
          title: new Text(title),
          backgroundColor: color,
        );
  final Widget _icon;
  final Color _color;
  final String _title;
  final BottomNavigationBarItem item;
}
