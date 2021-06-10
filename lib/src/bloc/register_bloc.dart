import 'dart:async';

import 'package:brigadapoli/src/bloc/validators.dart';
import 'package:rxdart/rxdart.dart';


class RegisterBloc with Validators{
  final _nameCrontroller = BehaviorSubject<String>();

  // Recuperar los datos del Stream
  Stream<String> get nameStream => _nameCrontroller.stream.transform(validateName);

  // Insertar valores al Stream
  Function(String) get changedName => _nameCrontroller.sink.add;


  // Obtener el último valor ingresado a los streams
  String get name => _nameCrontroller.value;

  dispose(){
    _nameCrontroller?.close();
  }
}
