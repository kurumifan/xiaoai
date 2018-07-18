import 'package:flutter/material.dart';

class KanePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new PageView(
        children: <Widget>[
          SafeArea(
            child: new Column(
              children: <Widget>[
                new Text('这是一个广告页面，委婉点讲，这是支持作者',style: TextStyle(fontSize: 50.0)),
                new RaisedButton(
                  color: Colors.pinkAccent,
                  child: Text('广告'),
                  onPressed: (){print('第一次点击后打开真正的页面');},
                ),
              ],
            ),
          ),
          new Image.asset('img/sampleloading.gif'),
        ],
      ),
    );
  }
}
