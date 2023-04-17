import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:jwt_decoder/jwt_decoder.dart';

class Auth with ChangeNotifier {
  String? _token;
  String? userid;
  DateTime? expiredAt;

  // Set User To Auth

  String get token {
    if (expiredAt != null &&
        expiredAt!.isAfter(DateTime.now()) &&
        _token != null) {
      return _token.toString();
    }
    return '';
  }

  bool get isAuth {
    return token != '';
  }

  // Factor Authenticate Function
  Future<void> _authenticate(
      String phoneNumber, String password, String urlPath) async {
    Uri url = Uri.parse('http://localhost:8585/api/v1/auth/$urlPath');

    // 1) Send Request
    try {
      var response = await http.post(url,
          headers: {
            'Content-type': 'application/json',
            'Accept': 'application/json',
          },
          body: jsonEncode(<String, String>{
            "phoneNumber": phoneNumber,
            "password": password,
            "passwordConfirm": password
          }));
      final responseBody = jsonDecode(response.body);
      // Check if the response status message is valid
      if (!responseBody['success']) {
        throw HttpException(responseBody['message'] ?? responseBody['message']);
      }

      // 2) Get Token From Response
      final decodedResponse = jsonDecode(response.body);
      // 3) Extract The User id and Expired Token date from token
      Map<String, dynamic> decodedJwt =
          JwtDecoder.decode(decodedResponse['token']);

      // 4) set _token and expired date and userid

      this._token = decodedResponse.token;
      this.userid = decodedJwt['id'];
      this.expiredAt =
          DateTime.now().add(Duration(seconds: int.parse(decodedJwt['exp'])));

      notifyListeners();
    } catch (error) {
      throw error;
    }
  }

  // Signup

  Future<void> signup(String phoneNumber, String password) async {
    return this._authenticate(phoneNumber, password, 'signup');
  }

  Future<void> signin(String phoneNumber, String password) async {
    return this._authenticate(phoneNumber, password, 'signin');
  }
}
