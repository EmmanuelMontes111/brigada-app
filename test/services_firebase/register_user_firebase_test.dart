import 'package:brigadapoli/src/bloc/provider.dart';
import 'package:brigadapoli/src/bloc/register_bloc.dart';
import 'package:brigadapoli/src/models/head_phone_model.dart';
import 'package:brigadapoli/src/providers/user_provider.dart';
import 'package:brigadapoli/src/services_firebaase/register_user_firebase.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockUserProvider extends Mock implements UserProvider{}

void main() {
  // RegisterUserFirebase _underTest;
  //
  // // setUp(() {
  // //   _bloc = new HeadPhonesBloc();
  // // });
  //
  // test('register test', () async {
  //   String email = "emmanuel34546@gmail.com";
  //   String password = "123456789";
  //   final authData = {
  //     'email': email,
  //     'password': password,
  //     'returnSecureToken': true,
  //   };
  //
  //   final mockUserProvider = MockUserProvider();
  //   RegisterBloc registerBloc;
  //   BuildContext context;
  //   var info = authData;
  //   Future<Map<String, dynamic>> response = info as Future<Map<String, dynamic>>;
  //   response.then((value) => authData);
  //   when(mockUserProvider.newUser(email, password)).thenReturn(response);
  //   _underTest = new RegisterUserFirebase.withMocks(mockUserProvider);
  //   _underTest.register(registerBloc, context);
  // });
}
