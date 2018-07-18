import 'package:flutter/material.dart';

Widget myinfo(BuildContext covariant){

  String _username = '赤座灯里';
  String _userprofile = '存在感爆表的女主角';



  return new Column(
    children: <Widget>[
      
      new Padding(padding: EdgeInsets.all(15.0),),
      new Container(
        decoration: new BoxDecoration(
          color: Colors.white,
          border: new Border(
            top: new BorderSide(color: new Color(0xFFBCBBC1),width: 0.0),
            bottom: new BorderSide(color: new Color(0xFFBCBBC1),width: 0.0),
          ),
        ),
        height: 150.0,
        child: new Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0,vertical: 8.0),
          child: new SafeArea(
            top: false,
            bottom: false,
            child: new Row(
              children: <Widget>[
                new Expanded(
                  child: new GestureDetector(
                    onTap: (){
                      Navigator.push(covariant,MaterialPageRoute(
                              builder: (context) =>
                                   AvatarScreen()));
                    },
                    child: new Hero(
                      tag:'avatarhero',
                      child: new Image.network('http://sixbit.nos-eastchina1.126.net/303-min.jpg'),
                    ),
                  ),
                ),
                new Padding(
                  padding: EdgeInsets.all(2.0),
                ),
                new Expanded(
                  child: new ListTile(
                    onTap: (){
                      print('哇，onTap！');                      
                    },
                    title: new Text(_username),
                    subtitle: new Text('\n$_userprofile'),
                  ),
                ),              
              ],
            ),
          ),
        ),
      ),

Padding(padding: const EdgeInsets.all(4.0),),

      Expanded(
              child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: new GestureDetector(
            child: Container(
              width: 1000.0,
              child: new Image.network('https://danbooru.donmai.us/data/sample/__unohana_no_sakuyahime_tenshinranman_drawn_by_ebibana__sample-c6bd1d520dc58ca2cc4898ed11a1e6df.jpg',height: 100.0,fit: BoxFit.cover,)),
            onTap: (){print('打开广告');},
            onLongPress: (){print('作者是个人，需要吃饭和交水电气那种,还有网费');},
          ),
        ),
      ),

       
          Expanded(
                      child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: new GestureDetector(
            child: Container(
              color: Colors.grey,
              width: 1000.0,
              child: Center(child: Text('现金支持',style: TextStyle(fontSize: 35.0,color: Colors.orangeAccent),))),
            onTap: (){print('打开广告');},
            onLongPress: (){print('作者是个人，需要吃饭和交水电气那种,还有网费');},
      ),
        ),
          ),

      
          Expanded(
                      child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: new GestureDetector(
            child: Container(
              color: Colors.grey,
              width: 1000.0,
              child: Center(child: Text('广告支持',style: TextStyle(fontSize: 35.0,color: Colors.orangeAccent),))),
            onTap: (){print('打开广告');},
            onLongPress: (){print('作者是个人，需要吃饭和交水电气那种,还有网费');},
      ),
        ),
          ),
     
          Expanded(
                      child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: new GestureDetector(             
            child: Container(
              color: Colors.grey,
              width: 1000.0,
              child: Center(child: Text('暂定',style: TextStyle(fontSize: 35.0,color: Colors.orangeAccent),))),
            onTap: (){print('打开广告');},
            onLongPress: (){print('作者是个人，需要吃饭和交水电气那种,还有网费');},
      ),
        ),
          ),
        
          Expanded(
                      child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: new GestureDetector(
            child: Container(
              color: Colors.grey,
              width: 1000.0,
              child: Center(child: Text('意见，建议，bug',style: TextStyle(fontSize: 35.0,color: Colors.orangeAccent),))),
            onTap: (){print('打开广告');},
            onLongPress: (){print('作者是个人，需要吃饭和交水电气那种,还有网费');},
      ),
        ),
          ),



          Expanded(
            child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: new GestureDetector(             
            child: Container(
              color: Colors.grey,
              width: 1000.0,
              child: RaisedButton(
                onPressed: (){print('打开广告');},
                child: Center(child: Text('关于，分享，主页',style: TextStyle(fontSize: 35.0,color: Colors.orangeAccent),)))),
           
            onLongPress: (){print('作者是个人，需要吃饭和交水电气那种,还有网费');},
      ),
        ),
          ),

      

    ],
  );
}


///点开头像
class AvatarScreen extends StatelessWidget {

  void _showDemoDialog({ BuildContext context, Widget child }) {
    showDialog(
      context: context,
      builder: (BuildContext context) => child,
    );    
  }


  @override
  Widget build(BuildContext context) {
    return new Stack(children: <Widget>[
      new SafeArea(
          child: GestureDetector(
        child: new Icon(
          Icons.arrow_back,
          color: Colors.white,
          size: 50.0,
        ),
        onTap: () {
          Navigator.pop(context);
        },
      )),
      new GestureDetector(
        child: new Hero(           
          tag: 'avatarhero',
          child: new Center(
              child: GestureDetector(
                onLongPress: (){                 
                  _showDemoDialog(
                    context: context,
                    child: new AlertDialog(
                    title: new RaisedButton(
                      child: new Text('照相'),
                      onPressed: (){},
                    ),
                    // content: const Text('123'),
                    content: new RaisedButton(
                      child: new Text('从相册中选择'),
                      onPressed: (){},
                    ),                   
                  ),
                  );                 
                },
                child: new Image.network(
            'http://sixbit.nos-eastchina1.126.net/303-min.jpg',
          ),
              )),
        ),
      )
    ]);
  }
}
