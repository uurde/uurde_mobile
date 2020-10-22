import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:uurde_mobile/api/vinyl_api.dart';
import 'package:uurde_mobile/model/vinyl_model.dart';

import 'vinyl_detail.dart';

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
      });
    });
  }

  initState() {
    super.initState();
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
      body: vinylWidget(),
    );
  }

  Widget vinylWidget() {
    return FutureBuilder(
        future: _getVinyls(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.none &&
              snapshot.hasData == null) {
            return Text("${snapshot.error}");
          }

          if (snapshot.hasData && snapshot.data.data.isEmpty) {
            if (snapshot.data.isProcessing) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return Center(
                child: Text('Found nothing'),
              );
            }
          }
          return ListView.separated(
            separatorBuilder: (context, index) => Divider(height: 1),
            itemCount: vinyls.length,
            itemBuilder: (context, index) {
              return new ListTile(
                leading: CircleAvatar(
                    child: Image.network(vinyls[index].albumCoverPath)),
                trailing: Icon(Icons.more_vert),
                title: new Text(vinyls[index].albumName),
                subtitle: new Text(vinyls[index].artistName),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => VinylDetail(vinyls[index]),
                      ));
                },
              );
            },
          );
        });
  }
}
