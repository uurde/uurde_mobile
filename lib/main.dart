import 'package:flutter/material.dart';
import 'package:uurde_mobile/pages/list/movie_list.dart';

import 'pages/list/vinyl_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'uurde admin',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'uurde admin'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(child: Text('My Page!')),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.only(top: 20.0),
          children: <Widget>[
            ListTile(
              title: Text('Book'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Movie'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MovieList()));
              },
            ),
            ListTile(
              title: Text('Vinyl'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => VinylList()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
