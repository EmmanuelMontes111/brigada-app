import 'dart:convert';

HeadPhoneModel headPhonesModelFromJson(String str) =>
    HeadPhoneModel.fromJson(json.decode(str));

String headPhonesModelToJson(HeadPhoneModel data) => json.encode(data.toJson());

class HeadPhoneModel {
  HeadPhoneModel({
    this.idFirebase = '',
    this.id = '',
    this.name = 'Audifono #',
    this.available = true,
    this.imageUrl,
  });

  String idFirebase;
  String id;
  String name;
  bool available;
  String imageUrl;

  factory HeadPhoneModel.fromJson(Map<String, dynamic> json) => HeadPhoneModel(
        idFirebase: json["idFirebase"],
        id: json["id"],
        name: json["name"],
        available: json["available"],
        imageUrl: json["imageUrl"],
      );

  Map<String, dynamic> toJson() => {
        "idFirebase": idFirebase,
        "id": id,
        "name": name,
        "available": available,
        "imageUrl": imageUrl,
      };
}
