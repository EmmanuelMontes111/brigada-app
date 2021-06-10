import 'dart:async';

import 'package:brigadapoli/src/bloc/validators.dart';
import 'package:rxdart/rxdart.dart';


class RegisterBloc with Validators{
  final _nameCrontroller = BehaviorSubject<String>();
  final _lastNameController = BehaviorSubject<String>();
  final _emailCrontroller = BehaviorSubject<String>();
  final _passwordCrontroller = BehaviorSubject<String>();

  // Recuperar los datos del Stream
  Stream<String> get nameStream => _nameCrontroller.stream.transform(validateName);
  Stream<String> get lastNameStream => _lastNameController.stream.transform(validateLastName);
  Stream<String> get emailStream => _emailCrontroller.stream.transform(validateEmail);
  Stream<String> get passwordStream => _passwordCrontroller.stream.transform(validatePassword);

  // Insertar valores al Stream
  Function(String) get changedName => _nameCrontroller.sink.add;
  Function(String) get changedLastName => _lastNameController.sink.add;
  Function(String) get changedEmail => _emailCrontroller.sink.add;
  Function(String) get changedPassword => _passwordCrontroller.sink.add;

  // Obtener el último valor ingresado a los streams
  String get name => _nameCrontroller.value;
  String get lastName => _lastNameController.value;
  String get email => _emailCrontroller.value;
  String get password => _passwordCrontroller.value;

  dispose(){
    _nameCrontroller?.close();
    _emailCrontroller?.close();
    _passwordCrontroller?.close();
  }
}
