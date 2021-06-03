import 'package:brigadapoli/src/bloc/kits_bloc.dart';
import 'package:brigadapoli/src/models/kit_model.dart';
import 'package:brigadapoli/src/providers/kit_provider.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockkitsProvider extends Mock implements KitsProvider {}

void main() {
  KitsBloc _bloc;

  // setUp(() {
  //   _bloc = new KitsBloc();
  // });

  test('load kit test', () async {
    KitModel kitModel = new KitModel();
    // ignore: deprecated_member_use
    final List<KitModel> kitsList1 = new List();
    kitsList1.add(kitModel);
    Future<List<KitModel>> kitsList;

    final mockKitsProvider = MockkitsProvider();
    when(mockKitsProvider.loadkits()).thenReturn(kitsList);

    _bloc = new KitsBloc.withMocks(mockKitsProvider);

    _bloc.kitsStream.listen((kit) {
      expect(kit, kitsList);
    });
    _bloc.loadKits();
  });

  test('load Kits test when the list is null', () async {
    Future<List<KitModel>> kitsList;
    kitsList = null;

    final mockKitsProvider = MockkitsProvider();
    when(mockKitsProvider.loadkits()).thenReturn(kitsList);

    _bloc = new KitsBloc.withMocks(mockKitsProvider);

    _bloc.kitsStream.listen((kit) {
      expect(kit, null);
    });
    _bloc.loadKits();
  });

  test('add Kits successful test ', () async {
    KitModel kitModel = new KitModel();
    Future<bool> response;

    final mockKitsProvider = MockkitsProvider();
    when(mockKitsProvider.createKit(any)).thenReturn(response);

    _bloc = new KitsBloc.withMocks(mockKitsProvider);

    _bloc.kitsStream.listen((iscreated) {
      expect(iscreated, true);
    });
    _bloc.addkits(kitModel);
  });
}
