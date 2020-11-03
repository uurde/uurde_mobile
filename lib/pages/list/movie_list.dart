import 'package:flutter/material.dart';
import 'package:uurde_mobile/model/movie_model.dart';
import 'package:uurde_mobile/api/movie_api.dart';
import 'package:uurde_mobile/pages/detail/movie_detail.dart';

class MovieList extends StatefulWidget {
  @override
  createState() => _MyListScreenState();
}

class _MyListScreenState extends State {
  MovieApi movieApi = new MovieApi();
  List<Movie> _searchResult = [];
  List<Movie> _movieDetails = [];
  TextEditingController textController = new TextEditingController();

  Future<Null> getMovieDetails() async {
    var responseJson = await movieApi.getMovies();
    setState(() {
      for (Map movie in responseJson) {
        _movieDetails.add(Movie.fromJson(movie));
      }
    });
  }

  onSearchTextChanged(String text) async {
    _searchResult.clear();
    if (text.isEmpty) {
      setState(() {});
      return;
    }
    _movieDetails.forEach((movieDetail) {
      if (movieDetail.movieName.toLowerCase().contains(text.toLowerCase())) {
        _searchResult.add(movieDetail);
      }
    });
    setState(() {});
  }

  initState() {
    super.initState();
    getMovieDetails();
  }

  dispose() {
    super.dispose();
  }

  @override
  build(context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movie List"),
      ),
      body: movieWidget(),
    );
  }

  Widget movieWidget() {
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
                      hintText: 'Search for movie name',
                      border: InputBorder.none),
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
                          child:
                              Image.network(_searchResult[i].moviePosterPath)),
                      trailing: Icon(Icons.more_vert),
                      title: new Text(_searchResult[i].movieName),
                      subtitle: new Text(_searchResult[i].directorName),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  MovieDetail(_searchResult[i]),
                            ));
                      },
                    );
                  },
                )
              : new ListView.separated(
                  separatorBuilder: (context, index) => Divider(height: 1),
                  itemCount: _movieDetails.length,
                  itemBuilder: (context, index) {
                    return new ListTile(
                      leading: CircleAvatar(
                          child: Image.network(
                              _movieDetails[index].moviePosterPath)),
                      trailing: Icon(Icons.more_vert),
                      title: new Text(_movieDetails[index].movieName),
                      subtitle: new Text(_movieDetails[index].directorName),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  MovieDetail(_movieDetails[index]),
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