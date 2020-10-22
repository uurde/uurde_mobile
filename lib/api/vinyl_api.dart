import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';

import 'package:uurde_mobile/model/vinyl_model.dart';
import 'header.dart';

class VinylApi {

  static Future<Vinyl> getVinyl() async {
    try {
      final response = await http.get(Header.baseUrl() + '/vinyls/1',
          headers: {'Authorization': Header.apiKey()});
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

  static Future getVinyls() async {
    try {
      final response = await http.get(Header.baseUrl().toString() + '/vinyls',
          headers: {'Authorization': Header.apiKey().toString()});
      if (response == null) {
        print('Error retrieving units.');
        return null;
      }
      return response;
    } on Exception catch (e) {
      print('$e');
      return null;
    }
  }
}
