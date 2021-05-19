import 'dart:convert';

import 'package:http/http.dart' as http;

class UserProvider {
  final String _firebaseToken = 'AIzaSyDa1eJoc5djVqRdWQrCs89DTi7g8-jZJ1E';


  Future<Map<String, dynamic>> login(String email, String password) async {

    final authData = {
      'email':  email,
      'password':  password,
      'returnSecureToken':  true,
    };

    final response =  await http.post(
        Uri.parse(
             'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=$_firebaseToken'),
        body:  json.encode(authData));

    Map<String, dynamic>  decodedResponse  =  json.decode(response.body);

    print(decodedResponse);
    print(response);
    if ( decodedResponse.containsKey('idToken') ) {
       return {'ok': true};
    } else {
       return {'ok': true, 'mensaje': decodedResponse['message']};
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
      return {'ok': true};
    } else {
      return {'ok': true, 'mensaje': decodedResponse['message']};
    }
  }
}
