import 'package:flutter/material.dart';
import 'package:uurde_mobile/api/vinyl_api.dart';
import 'package:uurde_mobile/model/vinyl_model.dart';

import '../detail/vinyl_detail.dart';

class VinylList extends StatefulWidget {
  @override
  createState() => _MyListScreenState();
}

class _MyListScreenState extends State {
  VinylApi vinylApi = new VinylApi();
  List<Vinyl> _searchResult = [];
  List<Vinyl> _vinylDetails = [];
  TextEditingController textController = new TextEditingController();

  Future<Null> getVinylDetails() async {
    var responseJson = await vinylApi.getVinyls();
    setState(() {
      for (Map vinyl in responseJson) {
        _vinylDetails.add(Vinyl.fromJson(vinyl));
      }
    });
  }

  onSearchTextChanged(String text) async {
    _searchResult.clear();
    if (text.isEmpty) {
      setState(() {});
      return;
    }
    _vinylDetails.forEach((vinylDetail) {
      if (vinylDetail.artistName.toLowerCase().contains(text.toLowerCase())) {
        _searchResult.add(vinylDetail);
      }
    });
    setState(() {});
  }

  initState() {
    super.initState();
    getVinylDetails();
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
    return Column(
      children: <Widget>[
        new Container(
          child: new Padding(
            padding: const EdgeInsets.all(8.0),
            child: new Card(
              child: new ListTile(
                leading: new Icon(Icons.search),
                title: new TextField(
                  controller: textController,
                  decoration: new InputDecoration(
                      hintText: 'Search for band name', border: InputBorder.none),
                  onChanged: onSearchTextChanged,
                ),
                trailing: new IconButton(
                  icon: new Icon(Icons.cancel),
                  onPressed: () {
                    textController.clear();
                    onSearchTextChanged('');
                  },
                ),
              ),
            ),
          ),
        ),
        new Expanded(
          child: _searchResult.length != 0 || textController.text.isNotEmpty
              ? new ListView.separated(
                  separatorBuilder: (context, index) => Divider(height: 1),
                  itemCount: _searchResult.length,
                  itemBuilder: (context, i) {
                    return new ListTile(
                      leading: CircleAvatar(
                          child: Image.network(
                              _searchResult[i].albumCoverPath)),
                      trailing: Icon(Icons.more_vert),
                      title: new Text(_searchResult[i].albumName),
                      subtitle: new Text(_searchResult[i].artistName),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => VinylDetail(_searchResult[i]),
                            ));
                      },
                    );
                  },
                )
              : new ListView.separated(
                  separatorBuilder: (context, index) => Divider(height: 1),
                  itemCount: _vinylDetails.length,
                  itemBuilder: (context, index) {
                    return new ListTile(
                      leading: CircleAvatar(
                          child: Image.network(
                              _vinylDetails[index].albumCoverPath)),
                      trailing: Icon(Icons.more_vert),
                      title: new Text(_vinylDetails[index].albumName),
                      subtitle: new Text(_vinylDetails[index].artistName),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => VinylDetail(_vinylDetails[index]),
                            ));
                      },
                    );
                  },
                ),
        ),
      ],
    );
  }
}
