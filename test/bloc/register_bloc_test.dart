import 'package:brigadapoli/src/bloc/login_bloc.dart';
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
    String nameExpected = "emmanuel";
    _bloc.nameStream
        .listen((email) => {})
        .onError((handleError) => expect(handleError, "Tu nombre es requerido"));
    _bloc.changedName(nameExpected);
  });
}
