import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'header.dart';

class MovieApi {
  Header _header = new Header();

  Future getMovies() async {
    try {
      final response = await http.get(
          _header.baseUrl().toString() + '/movies/GetMovieDetails',
          headers: {'Authorization': _header.apiKey().toString()});
      if (response == null) {
        print('Error retrieving units.');
        return null;
      }
      final responseJson = json.decode(response.body);
      return responseJson;
    } on Exception catch (e) {
      print('$e');
      return null;
    }
  }
}
