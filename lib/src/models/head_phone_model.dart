import 'dart:convert';

HeadPhonesModel headPhonesModelFromJson(String str) =>
    HeadPhonesModel.fromJson(json.decode(str));

String headPhonesModelToJson(HeadPhonesModel data) =>
    json.encode(data.toJson());

class HeadPhonesModel {
  HeadPhonesModel({
    this.id,
    this.name,
    this.available,
    this.imageUrl,
  });

  String id;
  String name;
  bool available;
  String imageUrl;

  factory HeadPhonesModel.fromJson(Map<String, dynamic> json) =>
      HeadPhonesModel(
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
