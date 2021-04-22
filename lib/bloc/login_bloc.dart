import 'dart:async';

class LoginBloc {
  final _emailCrontroller = StreamController<String>.broadcast();
  final _passwordCrontroller = StreamController<String>.broadcast();

  // Recuperar los datos del Stream
  Stream<String> get emailStream => _emailCrontroller.stream;

  Stream<String> get passwordStream => _passwordCrontroller.stream;

  // Insertar valores al Stream
  Function(String) get changedEmail => _emailCrontroller.sink.add;
  Function(String) get changedPassword => _passwordCrontroller.sink.add;


  dispose(){
    _emailCrontroller?.close();
    _passwordCrontroller?.close();
  }
}
