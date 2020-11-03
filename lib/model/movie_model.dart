import 'dart:convert';

Movie vinylFromJson(String str) {
  final jsonData = json.decode(str);
  return Movie.fromJson(jsonData);
}

Movie allVinylsFromJson(String str) {
  final jsonData = json.decode(str);
  return Movie.fromJson(jsonData);
}

String vinylToJson(Movie data) {
    final dyn = data.toJson();
    return json.encode(dyn);
}

class Movie {
  int movieId;
  String movieName;
  String directorName;
  String moviePosterPath;
  String movieReleaseDate;
  String imdbRating;
  String movieTypeName;

  Movie({this.movieId, this.movieName, this.directorName, this.moviePosterPath, this.movieReleaseDate, this.imdbRating, this.movieTypeName});

  factory Movie.fromJson(Map<String, dynamic> json) => new Movie(
        movieId: json['movieId'],
        movieName: json['movieName'],
        directorName: json['directorName'],
        moviePosterPath: json['moviePosterPath'],
        movieReleaseDate: json['movieReleaseDate'],
        imdbRating: json['imdbRating'],
        movieTypeName: json['movieTypeName'],
      );

  Map<String, dynamic> toJson() => {
        'movieId': movieId,
        'artistName': movieName,
        'directorName': directorName,
        'moviePosterPath': moviePosterPath,
        'movieReleaseDate': movieReleaseDate,
        'imdbRating': imdbRating,
        'movieTypeName': movieTypeName,
      };
}
