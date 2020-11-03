import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';

import 'package:uurde_mobile/model/vinyl_model.dart';
import 'header.dart';

class VinylApi {
  Header _header = new Header();

  Future<Vinyl> getVinyl() async {
    try {
      final response = await http.get(_header.baseUrl() + '/vinyls/1',
          headers: {'Authorization': _header.apiKey()});
      if (response == null || response.statusCode != HttpStatus.ok) {
        print('Error retrieving units.');
        return null;
      }
      return Vinyl.fromJson(jsonDecode(response.body));
    } on Exception catch (e) {
      print('$e');
      return null;
    }
  }

  Future getVinyls() async {
    try {
      final response = await http.get(
          _header.baseUrl().toString() + '/vinyls/GetVinylDetails',
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
