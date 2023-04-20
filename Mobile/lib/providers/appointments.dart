import 'dart:convert';

import 'package:app/domain/http_client.dart';
import 'package:flutter/foundation.dart';

class Appointments with ChangeNotifier {
  final String? token;

  late CustomHttpClient httpClient;

  Appointments({this.token}) {
    // Init Http Client
    httpClient = CustomHttpClient(token: token);
  }

  List _appointments = [];

  List get appointments => _appointments;

  // Get Appointments
  Future getMyAppointments() async {
    try {
      final response = await httpClient.get('appointments');
      this._appointments = jsonDecode(response.body)['data']['appointments'];
    } catch (e) {
      throw Exception(e);
    }
  }

  // Add Appointments
  Future addAppointment(Map<String, String> appointment) async {
    try {
      final body = jsonEncode(appointment);
      // Create new appointment
      await httpClient.post('appointments', body: body);
    } catch (e) {
      throw Exception(e);
    }

    // notifyListeners();
  }
  // Delete Appointments
}
