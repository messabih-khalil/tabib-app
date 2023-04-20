import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class CustomHttpClient with ChangeNotifier {
  final String? token;

  CustomHttpClient({this.token});

  static final String _baseUrl = 'http://localhost:8585/api/v1/';

  final http.Client _client = http.Client();

  Future<http.Response> get(String url) async {
    final headers = {'Authorization': 'Bearer $token'};
    final response =
        await _client.get(Uri.parse(_baseUrl + url), headers: headers);
    return response;
  }

  Future<http.Response> post(String url,
      {Map<String, String>? headers, dynamic body}) async {
    final token = this.token;
    headers ??= {};
    headers['Authorization'] = 'Bearer $token';
    final response = await _client.post(Uri.parse(_baseUrl + url),
        headers: headers, body: body);
    return response;
  }
}
