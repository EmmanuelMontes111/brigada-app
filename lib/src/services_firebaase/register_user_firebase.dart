import 'package:brigadapoli/src/bloc/register_bloc.dart';
import 'package:brigadapoli/src/providers/user_provider.dart';
import 'package:brigadapoli/src/utils/utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class RegisterUserFirebase {
  var info;
  UserProvider _userProvider;

  RegisterUserFirebase() {
    this._userProvider = new UserProvider();
  }

  RegisterUserFirebase.withMocks(this._userProvider);

  register(RegisterBloc registerBloc, BuildContext context,
      List<String> listRH) async {
    final _db = FirebaseFirestore.instance;
    DocumentReference ref = _db.collection('Users').doc(registerBloc.email);
    info =
        await _userProvider.newUser(registerBloc.email, registerBloc.password);
    if (info['ok']) {
      ref.set({
        'name': registerBloc.name,
        'lastName': registerBloc.lastName,
        'typeUser': 'BRIGADISTA',
        'id': registerBloc.id,
        'movil': 000,
        'rh': listRH[registerBloc.rh],
        'positionRHlist': registerBloc.rh,
        'eps': registerBloc.eps,
        'academiCareer': registerBloc.academicCareer,
        'activationStatus': false,
        // 'Image': '$imgUrl',
        'idKit': "000",
        'idRadio': "000",
        'idHeadPhones': "000",
      }).then((value) {
        Navigator.pushReplacementNamed(context, 'viewPages');
      });
    } else {
      viewAlert(context, "Email existente");
    }
  }
}
