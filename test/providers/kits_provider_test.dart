import 'package:brigadapoli/src/models/kit_model.dart';
import 'package:brigadapoli/src/providers/kit_provider.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

class MockClient extends Mock implements http.Client {}

void main() {
  MockClient _mockClient;
  KitsProvider _kitProvider;

  setUp(() {
    _mockClient = MockClient();
    _kitProvider = KitsProvider();
  });

  test('post method is executed', () async {
    KitModel kit = new KitModel();
    final String _url = 'brigada-poli-default-rtdb.firebaseio.com';
    final url = Uri.https(_url, "kits.json");
    when(_mockClient.post(url, headers: anyNamed('headers'))).thenAnswer(
        (_) async => http.Response(
            '{"available": true, "id": "68646767", "name": "Botiquín #0"}',
            200));

    var result = await _kitProvider.createKit(kit);

    expect(result, true);
  });

  test('get method is executed', () async {
    final String _url = 'brigada-poli-default-rtdb.firebaseio.com';
    final url = Uri.https(_url, "kits.json");
    when(_mockClient.get(url, headers: anyNamed('headers'))).thenAnswer(
        (_) async => http.Response(
            '{"available": true, "id": "68646767", "name": "Botiquín #0"}',
            200));

    var result = await _kitProvider.loadkits();

    expect(result, isInstanceOf<List<KitModel>>());
  });

  test('delete method is executed', () async {
    final String _url = 'brigada-poli-default-rtdb.firebaseio.com';
    final url = Uri.https(_url, "kits.json");
    when(_mockClient.delete(url, headers: anyNamed('headers'))).thenAnswer(
        (_) async => http.Response(
            '{"available": true, "id": "68646767", "name": "Botiquín #0"}',
            200));

    var result = await _kitProvider.deleteHeadPhones("68646767");

    expect(result, true);
  });

  test('put method is executed', () async {
    KitModel kit = new KitModel();
    final String _url = 'brigada-poli-default-rtdb.firebaseio.com';
    final url = Uri.https(_url, "kits.json");
    when(_mockClient.put(url, headers: anyNamed('headers'))).thenAnswer(
        (_) async => http.Response(
            '{"available": true, "id": "68646767", "name": "Botiquín #0"}',
            200));

    var result = await _kitProvider.createKit(kit);

    expect(result, true);
  });
}
