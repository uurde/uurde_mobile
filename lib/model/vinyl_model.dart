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

  Vinyl({this.vinylId, this.artistName, this.albumName});

  factory Vinyl.fromJson(Map<String, dynamic> json) => new Vinyl(
        vinylId: json['vinylId'],
        artistName: json['artistName'],
        albumName: json['albumName'],
      );

  Map<String, dynamic> toJson() => {
        "vinylId": vinylId,
        "artistName": artistName,
        "albumName": albumName,
      };
}
