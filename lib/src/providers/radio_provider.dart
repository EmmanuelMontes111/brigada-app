import 'dart:convert';
import 'package:brigadapoli/src/models/radio_model.dart';
import 'package:http/http.dart' as http;

class RadiosProvider {

  final String _url = 'brigada-poli-default-rtdb.firebaseio.com';


  Future<bool> createRadio(RadioModel radio) async {
    final url = Uri.https(_url, "radios.json");


    final response = await http.post(
        url, body: radiosModelToJson(radio));

    final decodeData = json.decode(response.body);

    print(decodeData);

    return true;
  }

  Future<bool> editRadio(RadioModel radio) async {
    final url = Uri.https(_url, "radios/${radio.idFirebase}.json");

    final response = await http.put(
        url, body: radiosModelToJson(radio));

    final decodeData = json.decode(response.body);

    print(decodeData);

    return true;
  }

  Future<List<RadioModel>> loadRadios() async {
    final url = Uri.https(_url, "radios.json");
    final response = await http.get(url);

    final Map<String, dynamic> decodeData = json.decode(response.body);
    // ignore: deprecated_member_use
    final List<RadioModel> radiosList =  new List();
    if (decodeData == null) return [];

    if (decodeData['error'] != null) return [];

    decodeData.forEach((idFirebase, radioJson) {
      print(radioJson);
      final radioTemp = RadioModel.fromJson(radioJson);
      radioTemp.idFirebase = idFirebase;
      
      radiosList.add(radioTemp);
    });
    return radiosList;
  }


  Future<bool> deleteRadios(String idFirebase) async{
    final url = Uri.https(_url, "radios/$idFirebase.json");
    final response = await http.delete(url);
    print(response.body);
    return true;
  }
}