import 'package:brigadapoli/src/bloc/login_bloc.dart';
import 'package:brigadapoli/src/models/user_model.dart';
import 'package:brigadapoli/src/providers/user_provider.dart';
import 'package:brigadapoli/src/utils/utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

import 'global_firebase.dart';

class LoginUserFirebase {
  UserProvider _userProvider;

  LoginUserFirebase() {
    this._userProvider = new UserProvider();
  }

  LoginUserFirebase.withMocks(this._userProvider);

  goToTapViewPage(LoginBloc bloc, BuildContext context) async {
    final _db = FirebaseFirestore.instance;
    Map info = await _userProvider.login(bloc.email, bloc.password);
    if (info['ok']) {
      Future<DocumentSnapshot> snapshot =
          _db.collection('Users').doc(bloc.email).get();
      snapshot.then((DocumentSnapshot user) {
        Global.brigadista = UserModel(
          id: user.data()['id'],
          name: user.data()['name'],
          lastName: user.data()['lastName'],
          movil: user.data()['movil'],
          rh: user.data()['rh'],
          positionRHlist: user.data()['positionRHList'],
          eps: user.data()['eps'],
          academiCareer: user.data()['academicCareer'],
          activationStatus: user.data()['activationStatus'],
          typeUser: user.data()['typeUser'],
          // image: user.data()['Image'],
          email: user.id,
          idKit: user.data()['idKit'],
          idRadio: user.data()['idRadio'],
          idHeadPhones: user.data()['idHeadPhones'],
        );
      }).then((value) {
        Navigator.pushReplacementNamed(context, 'viewPages');
      });
    } else {
      viewAlert(context, "Porfavor vuelve a intentarlo");
    }
  }
}
