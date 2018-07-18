import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../home_page.dart';

import 'package:flutter/rendering.dart';

import 'package:xml/xml.dart' as xml;
import 'package:http/http.dart' as http;
import 'dart:async';

class YanDeRe extends StatefulWidget {
  @override
  _YanDeReState createState() => new _YanDeReState();
}

class _YanDeReState extends State<YanDeRe> {
  int _counter = 0;
  ScrollController _hideButtonController;
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  var _isVisible;

  @override
  initState() {
    super.initState();
    _isVisible = false;
    _hideButtonController = new ScrollController();
    _hideButtonController.addListener(() {
      if (_hideButtonController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        setState(() {
          _isVisible = true;
          print("**** $_isVisible up");
        });
      }
      if (_hideButtonController.position.userScrollDirection ==
          ScrollDirection.forward) {
        setState(() {
          _isVisible = false;
          print("**** $_isVisible down");
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: _isVisible
          ? null
          : new AppBar(
              title: new Text('$_counter'),
            ),
      body: new Center(
          child: new CustomScrollView(
        controller: _hideButtonController,
        shrinkWrap: true,
        slivers: <Widget>[
          new SliverPadding(
            padding: const EdgeInsets.all(20.0),
            sliver: new SliverList(
              delegate: new SliverChildListDelegate(
                <Widget>[
                  const Text('I\'m dedicating every day to you'),
                  const Text('Domestic life was never quite my style'),
                  const Text('When you smile, you knock me out, I fall apart'),
                  const Text('And I thought I was so smart'),
                  const Text('And I thought I was so smart'),
                  const Text('And I thought I was so smart'),
                  const Text('And I thought I was so smart'),
                  const Text('And I thought I was so smart'),
                  const Text('And I thought I was so smart'),
                  const Text('And I thought I was so smart'),
                  const Text('And I thought I was so smart'),
                  const Text('And I thought I was so smart'),
                  const Text('And I thought I was so smart'),
                  const Text('And I thought I was so smart'),
                  const Text('And I thought I was so smart'),
                  const Text('And I thought I was so smart'),
                  const Text('And I thought I was so smart'),
                  const Text('And I thought I was so smart'),
                  const Text('And I thought I was so smart'),
                  const Text('And I thought I was so smart'),
                  const Text('And I thought I was so smart'),
                  const Text('And I thought I was so smart'),
                  const Text('And I thought I was so smart'),
                  const Text('And I thought I was so smart'),
                  const Text('And I thought I was so smart'),
                  const Text('And I thought I was so smart'),
                  const Text('And I thought I was so smart'),
                  const Text('And I thought I was so smart'),
                  const Text('And I thought I was so smart'),
                  const Text('And I thought I was so smart'),
                  const Text('And I thought I was so smart'),
                  const Text('And I thought I was so smart'),
                  const Text('And I thought I was so smart'),
                  const Text('And I thought I was so smart'),
                  const Text('And I thought I was so smart'),
                  const Text('And I thought I was so smart'),
                  const Text('And I thought I was so smart'),
                  const Text('And I thought I was so smart'),
                  const Text('And I thought I was so smart'),
                  const Text('And I thought I was so smart'),
                  const Text('And I thought I was so smart'),
                  const Text('And I thought I was so smart'),
                  const Text('And I thought I was so smart'),
                  const Text('And I thought I was so smart'),
                  const Text('And I thought I was so smart'),
                  const Text('And I thought I was so smart'),
                  const Text('And I thought I was so smart'),
                  const Text('And I thought I was so smart'),
                  const Text('And I thought I was so smart'),
                  const Text('And I thought I was so smart'),
                  const Text('And I thought I was so smart'),
                  const Text('And I thought I was so smart'),
                  const Text('And I thought I was so smart'),
                  const Text('And I thought I was so smart'),
                  const Text('And I thought I was so smart'),
                  const Text('And I thought I was so smart'),
                  const Text('And I thought I was so smart'),
                  const Text('And I thought I was so smart'),
                  const Text('And I thought I was so smart'),
                  const Text('And I thought I was so smart'),
                  const Text('And I thought I was so smart'),
                  const Text('And I thought I was so smart'),
                  const Text('And I thought I was so smart'),
                  const Text('And I thought I was so smart'),
                  const Text('And I thought I was so smart'),
                  const Text('And I thought I was so smart'),
                  const Text('And I thought I was so smart'),
                  const Text('And I thought I was so smart'),
                  const Text('And I thought I was so smart'),
                  const Text('And I thought I was so smart'),
                  const Text('And I thought I was so smart'),
                  const Text('I realize I am crazy'),
                ],
              ),
            ),
          ),
        ],
      )),
      floatingActionButton: new Opacity(
        opacity: _isVisible ? 1.0 : 0.0,
        child: new FloatingActionButton(
          onPressed: _incrementCounter,
          tooltip: 'Increment',
          child: new Icon(Icons.add),
        ),
      ),
    );
  }
}

Widget picc() {
  return new YanDeRe();
}

class YandereGridView extends StatefulWidget {
  @override
  _YandereGridViewState createState() => new _YandereGridViewState();
}

class _YandereGridViewState extends State<YandereGridView> {
  

  ///yandere
  String yanderexml = 'https://yande.re/post.xml?page=';
  List<String> yandere15preview;
  List<String> yandere20smaple;
  List<String> yandere24jpeg;
  List<String> yandere27jpegsize;
  List<String> yandere11filesize;

  ///下载页面
  void downloadpage(int aa) {
    double kk = int.parse(yandere27jpegsize[aa]) == 0
        ? int.parse(yandere11filesize[aa]) / 1024.round()
        : int.parse(yandere27jpegsize[aa]) / 1024.round();
    String kka = int.parse(yandere27jpegsize[aa]) / 1024.round() < 1000
        ? '${(int.parse(yandere27jpegsize[aa]) / 1024).round()} KB'
        : '${(int.parse(yandere27jpegsize[aa]) / 1024/1024).toStringAsFixed(2)} MB';
    String mmb = (kk / 1024).toStringAsFixed(2);
    String kkb = kk < 1000 ? '${kk.round().toInt()}KB' : '$mmb MB';

    Navigator.push(context,
        new MaterialPageRoute(builder: (BuildContext context) {
      return new Scaffold(
        appBar: new AppBar(
          backgroundColor: Colors.pink,
        ),
        body: new Column(
          children: <Widget>[
            Expanded(
              child: Container(
                width: 1000.0,
                child: new CachedNetworkImage(
                  imageUrl: yandere20smaple[aa],
                  // placeholder: Image.asset('img/aaloading.jpg'),
                  placeholder: new Column(children: <Widget>[
                    Expanded(
                      child: new CachedNetworkImage(
                        imageUrl: yandere15preview[aa],
                      ),
                    ),
                    new LinearProgressIndicator()
                  ]),
                  errorWidget: new Icon(Icons.error),
                  fit: BoxFit.scaleDown,
                ),
              ),
            ),
            new Text(int.parse(yandere27jpegsize[aa]) == 0 ? kkb : kka),
            new RaisedButton(
              onPressed: () {
                downloadImage(yandere24jpeg[aa]);
              },
              child: new Text('Download'),
            ),
          ],
        ),
      );
    }));
  }

  int yanderePage;
ScrollController _hideButtonController;
var _isVisible;

 @override
  initState() {
    super.initState();
  yanderePage = 1;
    getyandere();
    _isVisible = false;
    _hideButtonController = new ScrollController();
    _hideButtonController.addListener(() {
      if (_hideButtonController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        setState(() {
          _isVisible = true;
          print("**** $_isVisible up");
        });
      }
      if (_hideButtonController.position.userScrollDirection ==
          ScrollDirection.forward) {
        setState(() {
          _isVisible = false;
          print("**** $_isVisible down");
        });
      }
    });
  }


  /// yandere api
  Future<String> getyandere() async {
    http.Response response1 = await http.get(
      Uri.encodeFull(yanderexml + '$yanderePage'),
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


  @override
  Widget build(BuildContext context) {
    return yandere15preview == null
        ? new Scaffold(
            body: new Center(child: new CircularProgressIndicator()),
          )
        : new Scaffold(
            floatingActionButton: new FlatButton.icon(
              label: Icon(Icons.recent_actors),
              icon: Icon(Icons.record_voice_over),
              onPressed: () {
                setState(() {
                  yanderePage++;
                });

                getyandere();
              },
            ),
            appBar: _isVisible == true ? null : new AppBar(
               title: new Text('$yanderePage'),
                actions: <Widget>[
                  new IconButton(
                    icon: Icon(Icons.arrow_right),
                    onPressed: (){
                       setState(() {
                  yanderePage++;
                });

                getyandere();
                    },
                  )
                ],
            ),
            backgroundColor: Colors.black87,
            body: new GridView.count(
               crossAxisCount: setcount,
               mainAxisSpacing: 4.0,
               crossAxisSpacing: 4.0,
               padding: new EdgeInsets.all(4.0),
               children: new List<Widget>.generate(
                 yandere15preview.length,
                 (a) => new GestureDetector(
                       onTap: () {
                         downloadpage(a);
                       },
                       child: new CachedNetworkImage(
                         imageUrl: yandere15preview[a],

                         placeholder: Image.asset('img/picloading.jpg'),

                         errorWidget: new Icon(Icons.error),

                         // fit: BoxFit.cover,
                       ),
                     ),
               )));
  }
}

Widget yandere() {
  return new YandereGridView();
}

// Widget pic(BuildContext covariant) {

//   ///下载页面
//   void downloadpage(int aa) {
//     double kk = int.parse(yandere27jpegsize[aa]) == 0
//         ? int.parse(yandere11filesize[aa]) / 1024.round()
//         : int.parse(yandere27jpegsize[aa]) / 1024.round();
//     String kka = int.parse(yandere27jpegsize[aa]) / 1024.round() < 1000
//         ? '${(int.parse(yandere27jpegsize[aa]) / 1024).round()} KB'
//         : '${(int.parse(yandere27jpegsize[aa]) / 1024/1024).toStringAsFixed(2)} MB';
//     String mmb = (kk / 1024).toStringAsFixed(2);
//     String kkb = kk < 1000 ? '${kk.round().toInt()}KB' : '$mmb MB';

//     Navigator.push(covariant,
//         new MaterialPageRoute(builder: (BuildContext context) {
//       return new Scaffold(
//         appBar: new AppBar(
//           backgroundColor: Colors.pink,
//         ),
//         body: new Column(
//           children: <Widget>[
//             Expanded(
//               child: Container(
//                 width: 1000.0,
//                 child: new CachedNetworkImage(
//                   imageUrl: yandere20smaple[aa],
//                   // placeholder: Image.asset('img/aaloading.jpg'),
//                   placeholder: new Column(children: <Widget>[
//                     Expanded(
//                       child: new CachedNetworkImage(
//                         imageUrl: yandere15preview[aa],
//                       ),
//                     ),
//                     new LinearProgressIndicator()
//                   ]),
//                   errorWidget: new Icon(Icons.error),
//                   fit: BoxFit.scaleDown,
//                 ),
//               ),
//             ),
//             new Text(int.parse(yandere27jpegsize[aa]) == 0 ? kkb : kka),
//             new RaisedButton(
//               onPressed: () {
//                 downloadImage(yandere24jpeg[aa]);
//               },
//               child: new Text('Download'),
//             ),
//           ],
//         ),
//       );
//     }));
//   }

//  ///GridView
//   return yandere15preview == null
//       ? new Scaffold(
//           body: new Center(child: new CircularProgressIndicator()),
//         )
//       : new Scaffold(
//           backgroundColor: Colors.black87,
//           body: new GridView.count(
//               crossAxisCount: setcount,
//               mainAxisSpacing: 4.0,
//               crossAxisSpacing: 4.0,
//               padding: new EdgeInsets.all(4.0),
//               children: new List<Widget>.generate(
//                 yandere15preview.length,
//                 (a) => new GestureDetector(
//                       onTap: () {
//                         downloadpage(a);
//                       },
//                       child: new CachedNetworkImage(
//                         imageUrl: yandere15preview[a],
//                         placeholder: Image.asset('img/picloading.jpg'),
//                         errorWidget: new Icon(Icons.error),
//                         // fit: BoxFit.cover,
//                       ),
//                     ),
//               )));
// }
