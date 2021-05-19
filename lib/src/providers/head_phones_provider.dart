 import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:brigadapoli/src/models/head_phone_model.dart';

class HeadPhonesProvider {

  final String _url = 'brigada-poli-default-rtdb.firebaseio.com';


  Future<bool> createHeadPhone(HeadPhoneModel headPhone) async {
    final url = Uri.https(_url, "headPhones.json");


    final response = await http.post(
        url, body: headPhonesModelToJson(headPhone));

    final decodeData = json.decode(response.body);

    print(decodeData);

    return true;
  }

  Future<bool> editHeadPhone(HeadPhoneModel headPhone) async {
    final url = Uri.https(_url, "headPhones/${headPhone.idFirebase}.json");

    final response = await http.put(
        url, body: headPhonesModelToJson(headPhone));

    final decodeData = json.decode(response.body);

    print(decodeData);

    return true;
  }

  Future<List<HeadPhoneModel>> loadHeadPhones() async {
    final url = Uri.https(_url, "headPhones.json");
    final response = await http.get(url);

    final Map<String, dynamic> decodeData = json.decode(response.body);
    // ignore: deprecated_member_use
    final List<HeadPhoneModel> headPhonesList =  new List();
    if (decodeData == null) return [];

    decodeData.forEach((idFirebase, headPhoneJson) {
      print(headPhoneJson);
      final headPhoneTemp = HeadPhoneModel.fromJson(headPhoneJson);
      headPhoneTemp.idFirebase = idFirebase;
      
      headPhonesList.add(headPhoneTemp);
    });
    return headPhonesList;
  }


  Future<bool> deleteHeadPhones(String idFirebase) async{
    final url = Uri.https(_url, "headPhones/$idFirebase.json");
    final response = await http.delete(url);
    print(response.body);
    return true;
  }
}