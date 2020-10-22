import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:uurde_mobile/api/vinyl_api.dart';
import 'package:uurde_mobile/model/vinyl_model.dart';

class VinylList extends StatefulWidget {
  @override
  createState() => _MyListScreenState();
}

class _MyListScreenState extends State {
  var vinyls = new List<Vinyl>();

  _getVinyls() {
    VinylApi.getVinyls().then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        vinyls = list.map((model) => Vinyl.fromJson(model)).toList();
        //vinyls = json.decode(response.body);
      });
    });
  }

  initState() {
    super.initState();
    _getVinyls();
  }

  dispose() {
    super.dispose();
  }

  @override
  build(context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Vinyl List"),
        ),
        body: ListView.builder(
          itemCount: vinyls.length,
          itemBuilder: (context, index) {
            return ListTile(title: Text(vinyls[index].albumName));
          },
        ));
  }

  // @override
  // Widget build(context){
  //   return MaterialApp(
  //     title: 'Fetch Data Example',
  //     theme: ThemeData(
  //       primarySwatch: Colors.blue,
  //     ),
  //     home: Scaffold(
  //       appBar: AppBar(
  //         title: Text('Fetch Data Example'),
  //       ),
  //       body: Center(
  //         child: FutureBuilder<Vinyl>(
  //           future: vinyls,
  //           builder: (context, snapshot) {
  //             if (snapshot.hasData) {
  //               return Text(snapshot.data.albumName);
  //             } else if (snapshot.hasError) {
  //               return Text("${snapshot.error}");
  //             }

  //             // By default, show a loading spinner.
  //             return CircularProgressIndicator();
  //           },
  //         ),
  //       ),
  //     ),
  //   );

  // }

  // build(context) {
  //   return Scaffold(
  //       appBar: AppBar(
  //         title: Text("Vinyl List"),
  //       ),
  //       body: ListView.builder(
  //         itemCount: vinyls.length,
  //         itemBuilder: (context, index) {
  //           return ListTile(
  //               title: Text((index + 1).toString() +
  //                   '. ' +
  //                   vinyls[index].artistName +
  //                   ' - ' +
  //                   vinyls[index].albumName));
  //         },
  //       ));
  // }
}
