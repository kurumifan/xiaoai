import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;


String jieguo;

class TuLing extends StatefulWidget {
  @override
  _TuLingState createState() => new _TuLingState();
}

class _TuLingState extends State<TuLing> {
  /// post chat function
  Future<http.Response> tulingbot(String inputstr) async {
    var url = "http://www.tuling123.com/openapi/api";
    var body = {"key": "3b0c6a53ff5a4bea8af677d22faa64f9", "info": "$inputstr"};

    Map headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };
    var response = await http.post(Uri.encodeFull(url),
        body: body, headers: {'Accept': 'application/json'});

    var responseJson = json.decode(response.body);

    setState(() {
      jieguo = responseJson['text'];
      _abc.insert(0, jieguo);
      aa.insert(
        0,
        Row(
          children: <Widget>[
            Container(
                height: 50.0,
                width: 50.0,
                margin: const EdgeInsets.only(right: 10.0),
                child: Image.network(
                    'https://danbooru.donmai.us//data/preview/520640d2e27a268baeb13d3bd9d9b4d3.jpg')),
            Expanded(
              child: Text(
                _abc[0],
                textAlign: TextAlign.start,
              ),
            ),
          ],
        ),
      );
      _textController.clear();
    });
    return response;
  }

  var _textController = TextEditingController();

  List<String> _abc = [''];
  List<String> _cba = [''];

  List<Widget> aa = [
    Text(''),
  ];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('时雨&夕立'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.help),
            onPressed: (){
              showDialog(context: context,builder: (BuildContext context)=>AlertDialog(title: Text('暂时还没聊天记录功能'),));
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Flexible(
                child: ListView.builder(
              padding: EdgeInsets.all(8.0),
              reverse: true,
              itemBuilder: (_, int index) => aa[index],
              itemCount: aa.length,
            )),
            Divider(height: 3.0),
            Container(
              decoration: BoxDecoration(),
              child: Row(
                children: <Widget>[
                  Flexible(
                    child: TextField(
                      controller: _textController,
                    ),
                  ),
                  Container(
                    child: IconButton(
                      icon: Icon(Icons.send),
                      onPressed: () {
                        setState(() {
                          _cba.insert(0, _textController.text);
                          aa.insert(
                            0,
                            Row(
                              children: <Widget>[
                                Expanded(
                                  child: Text(
                                    _cba[0],
                                    textAlign: TextAlign.end,
                                  ),
                                ),
                                Container(
                                    height: 50.0,
                                    width: 50.0,
                                    margin: const EdgeInsets.only(left: 10.0),
                                    child: Image.network(
                                        'https://danbooru.donmai.us//data/preview/19dc6fe0ac860491cfaca4ee29c204e0.jpg'))
                              ],
                            ),
                          );
                        });
                        tulingbot(_textController.text);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
