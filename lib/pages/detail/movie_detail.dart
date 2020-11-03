import 'package:flutter/material.dart';
import 'package:uurde_mobile/model/movie_model.dart';
import 'dart:ui' as ui;
import 'package:intl/intl.dart';

class MovieDetail extends StatelessWidget {
  final Movie movie;
  MovieDetail(this.movie);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(movie.movieName),
      ),
      body: new Stack(fit: StackFit.expand, children: [
        new Image.network(movie.moviePosterPath, fit: BoxFit.cover),
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
                          image: new NetworkImage(movie.moviePosterPath),
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
                    children: <Widget>[],
                  ),
                ),
                new Text('Director Name: ' + movie.directorName,
                    style: new TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                new Text('Movie Media Type: ' + movie.movieTypeName,
                    style: new TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                new Text(
                    'Release Year: ' +
                        DateFormat('y')
                            .parse(movie.movieReleaseDate)
                            .year
                            .toString(),
                    style: new TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                new Text('IMDB Rating: ' + movie.imdbRating,
                    style: new TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
