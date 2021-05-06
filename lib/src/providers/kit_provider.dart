 import 'dart:convert';
import 'package:brigadapoli/src/models/kit_model.dart';
import 'package:http/http.dart' as http;

class KitsProvider {

  final String _url = 'brigada-poli-default-rtdb.firebaseio.com';


  Future<bool> createKit(KitModel kit) async {
    final url = Uri.https(_url, "kit.json");


    final response = await http.post(
        url, body: kitsModelToJson(kit));

    final decodeData = json.decode(response.body);

    print(decodeData);

    return true;
  }

  Future<bool> editKit(KitModel kit) async {
    final url = Uri.https(_url, "kits/${kit.idFirebase}.json");

    final response = await http.put(
        url, body: kitsModelToJson(kit));

    final decodeData = json.decode(response.body);

    print(decodeData);

    return true;
  }

  Future<List<KitModel>> loadkits() async {
    final url = Uri.https(_url, "kit.json");
    final response = await http.get(url);

    final Map<String, dynamic> decodeData = json.decode(response.body);
    // ignore: deprecated_member_use
    final List<KitModel> kitsList =  new List();
    if (decodeData == null) return [];

    decodeData.forEach((idFirebase, kitJson) {
      print(kitJson);
      final kitTemp = KitModel.fromJson(kitJson);
      kitTemp.idFirebase = idFirebase;
      
      kitsList.add(kitTemp);
    });
    return kitsList;
  }


  Future<bool> deleteHeadPhones(String idFirebase) async{
    final url = Uri.https(_url, "kit/$idFirebase.json");
    final response = await http.delete(url);
    print(response.body);
    return true;
  }
}