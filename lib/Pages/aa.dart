import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';

import '../home_page.dart';

class Aa extends StatefulWidget {
  @override
  _AaState createState() => new _AaState();
}

class _AaState extends State<Aa> {
  @override
  Widget build(BuildContext context) {
    return safeboorupreview == null
        ? new Scaffold(
            body: new Center(child: new CircularProgressIndicator()),
          )
        : Scaffold(
                  body: new Center(
              child: new GridView.count(
                  // maxCrossAxisExtent: 160.0,
                  crossAxisCount: 3,
                  mainAxisSpacing: 4.0,
                  crossAxisSpacing: 4.0,
                  padding: new EdgeInsets.all(4.0),
                  children: new List<Widget>.generate(
                    safeboorupreview.length,
                    (a) => new GestureDetector(
                          onTap: () {},
                          child: new CachedNetworkImage(
                            imageUrl: safeboorupreview[a],
                            placeholder: Image.asset('img/aaloading.jpg'),
                            errorWidget: new Icon(Icons.error),
                            // fit: BoxFit.cover,
                          ),
                        ),
                  ))),
        );
  }
}

Widget aa(covariant) {
  // return Center(
  //   child: new Image.network('https://danbooru.donmai.us/data/__sayori_doki_doki_literature_club_drawn_by_savi_byakushimc__aaa142a8bcfa5915391e64fc945dda43.gif'
  //   ),
  // );

  return danboorupreview == null
      ? new Scaffold(
          body: new Center(child: new CircularProgressIndicator()),
        )
      : new Center(
          child: new GridView.count(
              // maxCrossAxisExtent: 160.0,
              crossAxisCount: setcount,
              mainAxisSpacing: 4.0,
              crossAxisSpacing: 4.0,
              padding: new EdgeInsets.all(4.0),
              children: new List<Widget>.generate(
                danboorupreview.length,
                (a) => new GestureDetector(
                      onTap: () {
                        Navigator.of(covariant).push(new MaterialPageRoute(
                      builder: (BuildContext context) => new Aa()));
                      },
                      child: new CachedNetworkImage(
                        imageUrl: danboorupreview[a],
                        placeholder: Image.asset('img/aaloading.jpg'),
                        errorWidget: new Icon(Icons.error),
                        // fit: BoxFit.cover,
                      ),
                    ),
              )));
}
