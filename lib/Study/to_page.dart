import 'package:flutter/material.dart';

class ToPage extends StatefulWidget {
  @override
  _ToPageState createState() => new _ToPageState();
}

class _ToPageState extends State<ToPage> {
  var _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Center(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _textController,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  child: Image.network('https://danbooru.donmai.us/data/preview/aae6413ac96c49bd1c11e4b91e66c4ca.jpg'),
                  onTap: (){
                    Navigator.of(context).push(
                      MaterialPageRoute(builder:(BuildContext context)=> NextPage(value: _textController.text,))
                    );
                  },
                ),
              ),
              Text('点击图片跳转'),
            ],
          ),
        ),
      ),
    );
  }
}

class NextPage extends StatefulWidget {

  final String value;

  NextPage({Key key , this.value}) : super(key:key);

  @override
  _NextPageState createState() => new _NextPageState();
}

class _NextPageState extends State<NextPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: <Widget>[
        
      ],),
      body: Center(
        child: Text(widget.value,style: TextStyle(fontSize: 35.0,color: Colors.orange),),
      ),
    );
  }
}