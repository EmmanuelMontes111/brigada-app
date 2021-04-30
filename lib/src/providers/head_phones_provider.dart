import 'dart:convert';

import 'package:brigadapoli/src/models/head_phone_model.dart';
import 'package:http/http.dart' as http;

class HeadPhonesProvider {
  final String _url = 'brigada-poli-default-rtdb.firebaseio.com';

  Future<bool> createHeadPhone(HeadPhoneModel headPhone) async {
    final url = Uri.https(_url, "headPhones.json");

    final response =
        await http.post(url, body: headPhonesModelToJson(headPhone));

    final decodeData = json.decode(response.body);

    print(decodeData);

    return true;
  }
}
