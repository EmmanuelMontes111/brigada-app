import 'dart:async';

import 'package:brigadapoli/src/bloc/validators.dart';
import 'package:rxdart/rxdart.dart';

class RegisterBloc with Validators {
  final _nameController = BehaviorSubject<String>();
  final _lastNameController = BehaviorSubject<String>();
  final _idController = BehaviorSubject<String>();
  final _rhController = BehaviorSubject<int>();
  final _epsController = BehaviorSubject<String>();
  final _academicCareerController = BehaviorSubject<String>();
  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

  // Recuperar los datos del Stream
  Stream<String> get nameStream =>
      _nameController.stream.transform(validateName);

  Stream<String> get lastNameStream =>
      _lastNameController.stream.transform(validateLastName);

  Stream<String> get idStream => _idController.stream.transform(validateId);

  Stream<int> get rhStream => _rhController.stream.transform(validateRH);

  Stream<String> get epsStream => _epsController.stream.transform(validateEPS);

  Stream<String> get academicCareerStream =>
      _academicCareerController.stream.transform(validateAcademicCareer);

  Stream<String> get emailStream =>
      _emailController.stream.transform(validateEmail);

  Stream<String> get passwordStream =>
      _passwordController.stream.transform(validatePassword);

  Stream<bool> get formValidStream => Rx.combineLatest8(
      nameStream,
      lastNameStream,
      idStream,
      rhStream,
      epsStream,
      academicCareerStream,
      emailStream,
      passwordStream,
      (n, l, id, eps, r, a, e, p) => true);

  // Insertar valores al Stream
  Function(String) get changedName => _nameController.sink.add;

  Function(String) get changedLastName => _lastNameController.sink.add;

  Function(String) get changedId => _idController.sink.add;

  Function(int) get changedRH => _rhController.sink.add;

  Function(String) get changedEPS => _epsController.sink.add;

  Function(String) get changedAcademicCareer =>
      _academicCareerController.sink.add;

  Function(String) get changedEmail => _emailController.sink.add;

  Function(String) get changedPassword => _passwordController.sink.add;

  // Obtener el último valor ingresado a los streams
  String get name => _nameController.value;

  String get lastName => _lastNameController.value;

  String get id => _idController.value;

  int get rh => _rhController.value;

  String get eps => _epsController.value;

  String get academicCareer => _academicCareerController.value;

  String get email => _emailController.value;

  String get password => _passwordController.value;

  dispose() {
    _nameController?.close();
    _lastNameController?.close();
    _idController?.close();
    _rhController?.close();
    _epsController?.close();
    _academicCareerController?.close();
    _emailController?.close();
    _passwordController?.close();
  }
}
