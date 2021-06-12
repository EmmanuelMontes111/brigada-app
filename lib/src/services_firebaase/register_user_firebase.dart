import 'package:brigadapoli/src/bloc/register_bloc.dart';
import 'package:brigadapoli/src/providers/user_provider.dart';
import 'package:brigadapoli/src/utils/utils.dart';
import 'package:flutter/cupertino.dart';

class RegisterUserFirebase {
  var info;
  UserProvider _userProvider;

  RegisterUserFirebase(){
    this._userProvider = new  UserProvider();
  }

  RegisterUserFirebase.withMocks(this._userProvider);
  register(RegisterBloc registerBloc, BuildContext context) async {
    // final _db = FirebaseFirestore.instance;
    info = await _userProvider.newUser(registerBloc.email, registerBloc.password);
    if (info['ok']) {
      Navigator.pushReplacementNamed(context, 'viewPages');
    } else {
      viewAlert(context, "Email existente");
    }
  }
}
