import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';

import 'package:uurde_mobile/model/vinyl_model.dart';

class VinylApi {
  final _httpClient = HttpClient();
  final _url = 'http://uurde-api.ugurdegirmenci.com/api/vinyls';
  final _apiKey =
      '511d9200e32268e6bc1bb9bd3332ca8d01effb5287c2e315ec2e356ca98efe6a';

  Future<Vinyl> getVinyl() async {
    try {
      final response =
          await http.get('$_url/1', headers: {'Authorization': _apiKey});
      if (response == null || response.statusCode != HttpStatus.ok) {
        print('Error retrieving units.');
        return null;
      }
      return vinylFromJson(response.body);
    } on Exception catch (e) {
      print('$e');
      return null;
    }
  }

  static Future getVinyls() {
    try {
      final response =
         http.get('http://uurde-api.ugurdegirmenci.com/api/vinyls', headers: {'Authorization': '511d9200e32268e6bc1bb9bd3332ca8d01effb5287c2e315ec2e356ca98efe6a'});
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
