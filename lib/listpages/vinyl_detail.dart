import 'package:flutter/material.dart';
import 'dart:ui' as ui;

import 'package:uurde_mobile/model/vinyl_model.dart';

class VinylDetail extends StatelessWidget {
  final Vinyl vinyl;
  VinylDetail(this.vinyl);
  Color mainColor = const Color(0xff3C3261);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: new Stack(fit: StackFit.expand, children: [
      new Image.network(vinyl.albumCoverPath, fit: BoxFit.cover),
      new BackdropFilter(
          filter: new ui.ImageFilter.blur(sigmaX: 0.5, sigmaY: 0.5),
          child: new Container(
            color: Colors.black.withOpacity(0.5),
          )),
      new SingleChildScrollView(
          child: new Container(
              margin: const EdgeInsets.all(20.0),
              child: new Column(
                children: <Widget>[
                  new Container(
                    alignment: Alignment.center,
                    child: new Container(
                      width: 400.0,
                      height: 400.0,
                    ),
                    decoration: new BoxDecoration(
                        borderRadius: new BorderRadius.circular(10.0),
                        image: new DecorationImage(
                            image: new NetworkImage(vinyl.albumCoverPath),
                            fit: BoxFit.cover),
                        boxShadow: [
                          new BoxShadow(
                              color: Colors.black,
                              blurRadius: 20.0,
                              offset: new Offset(0.0, 10.0))
                        ]),
                  ),
                  new Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 20.0, horizontal: 0.0),
                    child: new Row(
                      children: <Widget>[
                        new Expanded(
                          child: new Text(vinyl.artistName,
                              style: new TextStyle(
                                  color: Colors.white, fontSize: 30.0)),
                        ),
                        new Text(vinyl.albumReleaseYear.toString(),
                            style: new TextStyle(
                                color: Colors.white, fontSize: 20.0)),
                      ],
                    ),
                  ),
                  new Text(vinyl.albumName,
                      style: new TextStyle(color: Colors.white)),
                  new Padding(padding: const EdgeInsets.all(10.0)),
                  new Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: new Container(
                      padding: const EdgeInsets.all(16.0),
                      alignment: Alignment.center,
                      child: new IconButton(
                        icon: Icon(Icons.arrow_back_ios),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        color: Colors.white,
                      ),
                      decoration: new BoxDecoration(
                          borderRadius: new BorderRadius.circular(10.0),
                          color: const Color(0xaa3C3261)),
                    ),
                  ),
                ],
              )))
    ]));
  }
}