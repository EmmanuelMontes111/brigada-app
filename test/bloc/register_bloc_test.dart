import 'package:brigadapoli/src/bloc/register_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  RegisterBloc _bloc;

  setUp(() {
    _bloc = RegisterBloc();
  });

  test('validate field name when not is empty', () {
    String nameExpected = "emmanuel";
    _bloc.nameStream.listen((name) {
      expect(name, nameExpected);
    });
    _bloc.changedName(nameExpected);
  });

  test('validate field name when is empty', () {
    String nameExpected = "";
    _bloc.nameStream
        .listen((name) => {})
        .onError((handleError) => expect(handleError, "Tu nombre es requerido"));
    _bloc.changedName(nameExpected);
  });


  test('validate field lastName when not is empty', () {
    String lastNameExpected = "Montes";
    _bloc.lastNameStream.listen((lastName) {
      expect(lastName, lastNameExpected);
    });
    _bloc.changedLastName(lastNameExpected);
  });

  test('validate field lastName when is empty', () {
    String lastNameExpected = "";
    _bloc.lastNameStream
        .listen((lastName) => {})
        .onError((handleError) => expect(handleError, "Tu apellido es requerido"));
    _bloc.changedLastName(lastNameExpected);
  });

  test('validate id when it has more than 7 characters', () {
    String idExpected = "1038665166";
    _bloc.idStream.listen((id) {
      expect(id, idExpected);
    });
    _bloc.changedId(idExpected);
  });

  test('validate id when it has less than 6 characters', () {
    String passwordExpected = "123";
    _bloc.idStream.listen((id) => {}).onError(
            (handleError) => expect(handleError, "Documento no valido"));
    _bloc.changedId(passwordExpected);
  });

  test('validate Email when is valid', () {
    String emailExpected = "emmanuelmontes@gmail.com";
    _bloc.emailStream.listen((email) {
      expect(email, emailExpected);
    });
    _bloc.changedEmail(emailExpected);
  });

  test('validate Email when not is valid', () {
    String emailExpected = "emmanuelmontes";
    _bloc.emailStream
        .listen((email) => {})
        .onError((handleError) => expect(handleError, "Email no valido"));
    _bloc.changedEmail(emailExpected);
  });

  test('validate Password when it has more than 6 characters', () {
    String passwordExpected = "123456789";
    _bloc.passwordStream.listen((password) {
      expect(password, passwordExpected);
    });
    _bloc.changedPassword(passwordExpected);
  });

  test('validate Password when it has less than 6 characters', () {
    String passwordExpected = "123";
    _bloc.passwordStream.listen((password) => {}).onError(
            (handleError) => expect(handleError, "Debe tener más de 6 caracteres"));
    _bloc.changedPassword(passwordExpected);
  });
}
