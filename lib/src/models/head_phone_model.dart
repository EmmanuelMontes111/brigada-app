import 'dart:convert';

HeadPhoneModel headPhonesModelFromJson(String str) =>
    HeadPhoneModel.fromJson(json.decode(str));

String headPhonesModelToJson(HeadPhoneModel data) =>
    json.encode(data.toJson());

class HeadPhoneModel {
  HeadPhoneModel({
    this.id = '',
    this.name = 'Audifono #',
    this.available = true,
    this.imageUrl,
  });

  String id;
  String name;
  bool available;
  String imageUrl;

  factory HeadPhoneModel.fromJson(Map<String, dynamic> json) =>
      HeadPhoneModel(
        id: json["id"],
        name: json["name"],
        available: json["available"],
        imageUrl: json["imageUrl"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "available": available,
        "imageUrl": imageUrl,
      };
}
