import 'dart:convert';

import 'package:app/domain/http_client.dart';
import 'package:flutter/foundation.dart';

class Specialities with ChangeNotifier {
  final String? token;

  late CustomHttpClient httpClient;

  Specialities({this.token}) {
    // Init Http Client
    httpClient = CustomHttpClient(token: token);
  }

  List _specialities = [];

  List get specialities => _specialities;

  // Get Specialities

  Future<void> getSpecialities() async {
    try {
      final response = await httpClient.get('specialities');
      this._specialities = jsonDecode(response.body)['data']['specialities'];
    } catch (e) {
      throw Exception(e);
    }
  }
}
