import 'dart:async';

import 'package:brigadapoli/src/bloc/validators.dart';
import 'package:rxdart/rxdart.dart';


class LoginBloc with Validators{
  final _emailCrontroller = BehaviorSubject<String>();
  final _passwordCrontroller = BehaviorSubject<String>();

  // Recuperar los datos del Stream
  Stream<String> get emailStream => _emailCrontroller.stream.transform(validateEmail);

  Stream<String> get passwordStream => _passwordCrontroller.stream.transform(validatePassword);

  Stream<bool> get formValidStream =>
      Rx.combineLatest2(emailStream, passwordStream, (e, p) => true);

  // Insertar valores al Stream
  Function(String) get changedEmail => _emailCrontroller.sink.add;
  Function(String) get changedPassword => _passwordCrontroller.sink.add;


  // Obtener el último valor ingresado a los streams
  String get email => _emailCrontroller.value;
  String get password => _passwordCrontroller.value;

  dispose(){
    _emailCrontroller?.close();
    _passwordCrontroller?.close();
  }
}
