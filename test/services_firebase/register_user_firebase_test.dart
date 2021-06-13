import 'package:brigadapoli/src/providers/user_provider.dart';
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
