import 'package:brigadapoli/src/providers/user_provider.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

class MockClient extends Mock implements http.Client {}

// class MockSharedPreferences extends Mock implements SharedPreferences {
// }

void main() {
  MockClient _mockClient;
  // MockSharedPreferences _sharedPreferences;
  UserProvider _userProvider;

  setUp(() {
    _mockClient = MockClient();
    // _sharedPreferences = MockSharedPreferences();
    _userProvider = UserProvider();
  });

  // test('User is valid', () async {
  //   String email = 'tes@test.com';
  //   String password = '123456789';
  //
  //   final String _url = 'brigada-poli-default-rtdb.firebaseio.com';
  //   final url = Uri.https(_url, "userModels.json");
  //   when(_mockClient.post(url, body: anyNamed('body')))
  //       .thenAnswer((_) async => http.Response('{"ok": true}', 200));
  //   when(_sharedPreferences.setString("key", "value"))
  //       .thenAnswer((realInvocation) async  => true);
  //
  //   var result = await _userProvider.login(email, password);
  //
  //   expect(result, {'ok': true});
  // });

  test('User is invalid', () async {
    String email = 'testInvalid@test.com';
    String password = '123456789';
    final String _url = 'brigada-poli-default-rtdb.firebaseio.com';
    final url = Uri.https(_url, "userModels.json");
    when(_mockClient.post(url, body: anyNamed('body'))).thenAnswer(
        (_) async => http.Response('{"ok": true, "message": null}', 200));

    var result = await _userProvider.login(email, password);

    expect(result, {'ok': false, 'message': null});
  });
}
