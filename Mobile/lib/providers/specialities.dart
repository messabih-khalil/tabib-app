import 'dart:convert';

import 'package:app/domain/http_client.dart';
import 'package:flutter/foundation.dart';

class Specialities with ChangeNotifier {
  // Init Http Client
  final httpClient = CustomHttpClient();

  List _specialities = [];

  List get specialities => _specialities;

  // Get Specialities

  Future<void> getSpecialities() async {
    try {
      final response = await httpClient.get('specialities');
      print(jsonDecode(response.body)['data']['specialities'][0]['image']);
      this._specialities = jsonDecode(response.body)['data']['specialities'];
    } catch (e) {
      throw Exception(e);
    }
  }
}
