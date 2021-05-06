import 'dart:convert';

KitModel kitsModelFromJson(String str) =>
    KitModel.fromJson(json.decode(str));

String kitsModelToJson(KitModel data) => json.encode(data.toJson());

class KitModel {
  KitModel({
    this.idFirebase,
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

  factory KitModel.fromJson(Map<String, dynamic> json) => KitModel(
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
