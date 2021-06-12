import 'package:brigadapoli/src/bloc/login_bloc.dart';
import 'package:brigadapoli/src/providers/user_provider.dart';
import 'package:brigadapoli/src/utils/utils.dart';
import 'package:flutter/cupertino.dart';

class LoginUserFirebase {

  UserProvider _userProvider;

  LoginUserFirebase() {
    this._userProvider = new UserProvider();
  }

  LoginUserFirebase.withMocks(this._userProvider);

  goToTapViewPage(LoginBloc bloc, BuildContext context) async {
    Map info = await _userProvider.login(bloc.email, bloc.password);

    if (info['ok']) {
      Navigator.pushReplacementNamed(context, 'viewPages');
    } else {
      viewAlert(context, "Porfavor vuelve a intentarlo");
    }
  }
}
