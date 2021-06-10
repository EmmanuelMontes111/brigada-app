import 'dart:async';

class Validators {
  final validateEmail =
      StreamTransformer<String, String>.fromHandlers(handleData: (email, sink) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(pattern);

    if (regExp.hasMatch(email)) {
      sink.add(email);
    } else {
      sink.addError('Email no valido');
    }
  });

  final validatePassword = StreamTransformer<String, String>.fromHandlers(
      handleData: (password, sink) {
    if (password.length > 6) {
      sink.add(password);
    } else {
      sink.addError('Debe tener más de 6 caracteres');
    }
  });

  final validateName =
      StreamTransformer<String, String>.fromHandlers(handleData: (name, sink) {
    if (name.isNotEmpty) {
      sink.add(name);
    } else {
      sink.addError('Tu nombre es requerido');
    }
  });


  final validateLastName =
  StreamTransformer<String, String>.fromHandlers(handleData: (lastName, sink) {
    if (lastName.isNotEmpty) {
      sink.add(lastName);
    } else {
      sink.addError('Tu apellido es requerido');
    }
  });

  final validateId =
  StreamTransformer<String, String>.fromHandlers(handleData: (id, sink) {
    if (id.length > 7) {
      sink.add(id);
    } else {
      sink.addError('Documento no valido');
    }
  });

  final validateEPS =
  StreamTransformer<String, String>.fromHandlers(handleData: (eps, sink) {
    if (eps.isNotEmpty) {
      sink.add(eps);
    } else {
      sink.addError('EPS es requerida');
    }
  });
}