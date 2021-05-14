import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String usersModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel(
      {this.idFirebase,
      this.name,
      this.lastName,
      this.id,
      this.movil,
      this.rh,
      this.eps,
      this.positionRHlist,
      this.typeUser,
      this.activationStatus,
      this.academiCareer,
      this.image,
      this.email,
      this.idKit,
      this.idRadio,
      this.idHeadPhones});

  String idFirebase;
  String name;
  String lastName;
  String id;
  int movil;
  String rh;
  String eps;
  int positionRHlist;
  String typeUser;
  bool activationStatus;
  String academiCareer;
  String image;
  String email;
  String idKit;
  String idRadio;
  String idHeadPhones;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        idFirebase: json["idFirebase"],
        name: json["name"],
        lastName: json["lastName"],
        id: json["id"],
        movil: json["movil"],
        rh: json["rh"],
        eps: json["eps"],
        positionRHlist: json["positionRHlist"],
        typeUser: json["typeUser"],
        activationStatus: json["activationStatus"],
        academiCareer: json["academiCareer"],
        image: json["image"],
        email: json["email"],
        idKit: json["idKit"],
        idRadio: json["idRadio"],
        idHeadPhones: json["idHeadPhones"],
      );

  Map<String, dynamic> toJson() => {
        "idFirebase": idFirebase,
        "name": name,
        "lastName": lastName,
        "id": id,
        "movil": movil,
        "rh": rh,
        "positionRHlist": positionRHlist,
        "typeUser": typeUser,
        "activationStatus": activationStatus,
        "academiCareer": academiCareer,
        "image": image,
        "email": email,
        "idKit": idKit,
        "idRadio": idRadio,
        "idHeadPhones": idHeadPhones,
      };
}
