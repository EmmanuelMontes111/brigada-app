import 'dart:convert';

import 'package:brigadapoli/src/%20user_preferences/user_preferences.dart';
import 'package:http/http.dart' as http;

class UserProvider {
  final String _firebaseToken = 'AIzaSyDa1eJoc5djVqRdWQrCs89DTi7g8-jZJ1E';
  final _preferences = new UserPreferences();

  Future<Map<String, dynamic>> login(String email, String password) async {
    final authData = {
      'email': email,
      'password': password,
      'returnSecureToken': true,
    };

    final response = await http.post(
        Uri.parse(
            'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=$_firebaseToken'),
        body: json.encode(authData));

    Map<String, dynamic> decodedResponse = json.decode(response.body);

    print(decodedResponse);
    print(response);
    if (decodedResponse.containsKey('idToken')) {
      _preferences.token = decodedResponse['idToken'];

      return {'ok': true};
    } else {
      return {'ok': false, 'message': decodedResponse['message']};
    }
  }

  Future<Map<String, dynamic>> newUser(String email, String password) async {
    final authData = {
      'email': email,
      'password': password,
      'returnSecureToken': true,
    };
    final response = await http.post(
        Uri.parse(
            'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=$_firebaseToken'),
        body: json.encode(authData));

    Map<String, dynamic> decodedResponse = json.decode(response.body);

    print(decodedResponse);
    print(response);
    if (decodedResponse.containsKey('idToken')) {
      _preferences.token = decodedResponse['idToken'];
      return {'ok': true};
    } else {
      return {'ok': false, 'message': decodedResponse['message']};
    }
  }
}
