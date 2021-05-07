import 'package:brigadapoli/src/models/radio_model.dart';
import 'package:brigadapoli/src/providers/radio_provider.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

class MockClient extends Mock implements http.Client {}

void main() {
  MockClient _mockClient;
  RadiosProvider _radioProvider;

  setUp(() {
    _mockClient = MockClient();
    _radioProvider = RadiosProvider();
  });

  test('post method is executed', () async {
    RadioModel kit = new RadioModel();
    final String _url = 'brigada-poli-default-rtdb.firebaseio.com';
    final url = Uri.https(_url, "radios.json");
    when(_mockClient.post(url, headers: anyNamed('headers'))).thenAnswer(
        (_) async => http.Response(
            '{"available": true, "id": "68646767", "name": "Radio #0"}', 200));

    var result = await _radioProvider.createRadio(kit);

    expect(result, true);
  });

  test('get method is executed', () async {
    final String _url = 'brigada-poli-default-rtdb.firebaseio.com';
    final url = Uri.https(_url, "radios.json");
    when(_mockClient.get(url, headers: anyNamed('headers'))).thenAnswer(
        (_) async => http.Response(
            '{"available": true, "id": "68646767", "name": "Radio #0"}', 200));

    var result = await _radioProvider.loadRadios();

    expect(result, isInstanceOf<List<RadioModel>>());
  });

  test('delete method is executed', () async {
    final String _url = 'brigada-poli-default-rtdb.firebaseio.com';
    final url = Uri.https(_url, "radios.json");
    when(_mockClient.delete(url, headers: anyNamed('headers'))).thenAnswer(
        (_) async => http.Response(
            '{"available": true, "id": "68646767", "name": "Radio #0"}', 200));

    var result = await _radioProvider.deleteRadios("68646767");

    expect(result, true);
  });

  test('put method is executed', () async {
    RadioModel kit = new RadioModel();
    final String _url = 'brigada-poli-default-rtdb.firebaseio.com';
    final url = Uri.https(_url, "radios.json");
    when(_mockClient.put(url, headers: anyNamed('headers'))).thenAnswer(
        (_) async => http.Response(
            '{"available": true, "id": "68646767", "name": "Radio #0"}', 200));

    var result = await _radioProvider.createRadio(kit);

    expect(result, true);
  });
}
