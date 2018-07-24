import 'package:flutter/material.dart';

import '../Study/to_page.dart';
import '../Study/tuling123.dart';

Widget study(BuildContext covariant){
  return  Scaffold(
    body: Center(
      child: Column(
        children: <Widget>[
          Text("不需要一直new真舒服！",style: TextStyle(fontSize: 35.0,color: Colors.red),),
          Padding(padding: EdgeInsets.all(5.0),),
          RaisedButton(
            onPressed: (){_topage(covariant);},
            child: Text('带值跳转页面',style: TextStyle(color: Colors.purple),),
          ),
          Padding(padding: EdgeInsets.all(5.0),),
          RaisedButton(
            onPressed: (){_tuling123(covariant);},
            child: Text('聊天机器人测试',style: TextStyle(color: Colors.purple),),
          ),
          
        ],
      ),
    ),
  );
}

_topage(BuildContext covariant){
  Navigator.of(covariant).push(MaterialPageRoute(
    builder: (BuildContext context){
      return  ToPage();
    }
  ));
}
_tuling123(BuildContext covariant){
  Navigator.of(covariant).push(MaterialPageRoute(
    builder: (BuildContext context){
      return  TuLing();
    }
  ));
}
