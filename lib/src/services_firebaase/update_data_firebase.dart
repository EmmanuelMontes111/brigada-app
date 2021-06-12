import 'package:brigadapoli/src/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UpdateDataFirebase{

  updateData(UserModel brigadista) async{
    final _db = FirebaseFirestore.instance;
    DocumentReference ref = _db.collection('Users').doc(brigadista.email);
    ref.set({
      'name': brigadista.name,
      'lastName': brigadista.lastName,
      'typeUser': brigadista.typeUser,
      'Id': brigadista.id,
      'movil': brigadista.movil,
      'rh': brigadista.rh,
      'positionRHlist': brigadista.positionRHlist,
      'eps': brigadista.eps,
      'academiCareer': brigadista.academiCareer,
      'activationStatus': brigadista.activationStatus,
      // 'Image': brigadista.image,
      'idKit': brigadista.idKit,
      'idRadio': brigadista.idRadio,
      'idHeadPhones': brigadista.idHeadPhones,
    });
  }
}