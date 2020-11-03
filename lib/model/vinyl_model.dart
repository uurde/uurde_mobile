import 'dart:convert';

Vinyl vinylFromJson(String str) {
  final jsonData = json.decode(str);
  return Vinyl.fromJson(jsonData);
}

Vinyl allVinylsFromJson(String str) {
  final jsonData = json.decode(str);
  return Vinyl.fromJson(jsonData);
}

String vinylToJson(Vinyl data) {
    final dyn = data.toJson();
    return json.encode(dyn);
}

class Vinyl {
  int vinylId;
  String artistName;
  String albumName;
  String albumCoverPath;
  int albumReleaseYear;
  String albumGenre;
  String vinylTypeName;

  Vinyl({this.vinylId, this.artistName, this.albumName, this.albumCoverPath, this.albumReleaseYear, this.albumGenre, this.vinylTypeName});

  factory Vinyl.fromJson(Map<String, dynamic> json) => new Vinyl(
        vinylId: json['vinylId'],
        artistName: json['artistName'],
        albumName: json['albumName'],
        albumCoverPath: json['albumCoverPath'],
        albumReleaseYear: json['albumReleaseYear'],
        albumGenre: json['albumGenre'],
        vinylTypeName: json['vinylTypeName'],
      );

  Map<String, dynamic> toJson() => {
        'vinylId': vinylId,
        "artistName": artistName,
        "albumName": albumName,
        "albumCoverPath": albumCoverPath,
        "albumReleaseYear": albumReleaseYear,
        'albumGenre': albumGenre,
        'vinylTypeName': vinylTypeName,
      };
}
