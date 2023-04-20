import 'dart:convert';

import 'package:app/domain/http_client.dart';
import 'package:flutter/foundation.dart';

class DoctorsProvider with ChangeNotifier {
  final String? token;

  late CustomHttpClient httpClient;

  DoctorsProvider({this.token}) {
    // Init Http Client
    httpClient = CustomHttpClient(token: token);
  }

  List _doctors = [];

  List get doctors => _doctors;
  // Get All Doctors

  Future getAllDoctors() async {
    try {
      final response = await httpClient.get('users/profiles/doctors');
      this._doctors = jsonDecode(response.body)['data']['doctorsProfiles'];
    } catch (e) {
      throw Exception(e);
    }
  }

  // Get Doctors by speciality
  Future<void> getDoctors(String specialityId) async {
    try {
      final response = await httpClient
          .get('users/profiles/doctors?speciality=$specialityId');
      this._doctors = jsonDecode(response.body)['data']['doctorsProfiles'];
    } catch (e) {
      throw Exception(e);
    }
  }
  // Filter Doctors by location

  // Search doctor by name
}
