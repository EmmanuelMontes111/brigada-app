import 'package:brigadapoli/src/models/head_phone_model.dart';
import 'package:brigadapoli/src/providers/head_phones_provider.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

class MockClient extends Mock implements http.Client {}

void main() {
  MockClient _mockClient;
  HeadPhonesProvider _headPhoneProvider;

  setUp(() {
    _mockClient = MockClient();
    _headPhoneProvider = HeadPhonesProvider();
  });

  test('validate string when is numeric', () async {
    HeadPhoneModel headPhone = new HeadPhoneModel();
    final String _url = 'brigada-poli-default-rtdb.firebaseio.com';
    final url = Uri.https(_url, "headPhones.json");
    when(_mockClient.post(url, headers: anyNamed('headers'))).thenAnswer(
        (_) async => http.Response(
            '{"available": true, "id": "68646767", "name": "Audifono #0"}', 200));

    var result =  await _headPhoneProvider.createHeadPhone(headPhone);

    expect(result, true);
  });
}
