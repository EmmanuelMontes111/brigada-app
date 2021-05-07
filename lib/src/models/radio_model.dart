import 'dart:convert';

RadioModel radiosModelFromJson(String str) =>
    RadioModel.fromJson(json.decode(str));

String kitsModelToJson(RadioModel data) => json.encode(data.toJson());

class RadioModel {
  RadioModel({
    this.idFirebase,
    this.id = '',
    this.name = 'Radio #',
    this.available = true,
    this.imageUrl,
  });

  String idFirebase;
  String id;
  String name;
  bool available;
  String imageUrl;

  factory RadioModel.fromJson(Map<String, dynamic> json) => RadioModel(
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
