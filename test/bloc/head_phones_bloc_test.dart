import 'package:brigadapoli/src/bloc/head_phones_bloc.dart';
import 'package:brigadapoli/src/models/head_phone_model.dart';
import 'package:brigadapoli/src/providers/head_phones_provider.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockHeadPhonesProvider extends Mock implements HeadPhonesProvider {}

void main() {
  HeadPhonesBloc _bloc;

  // setUp(() {
  //   _bloc = new HeadPhonesBloc();
  // });

  test('load HeadPhones test', () async {
    HeadPhoneModel headPhoneModel = new HeadPhoneModel();
    final List<HeadPhoneModel> headPhonesList1 = new List();
    headPhonesList1.add(headPhoneModel);
    Future<List<HeadPhoneModel>> headPhonesList;

    final mockHeadPhonesProvider = MockHeadPhonesProvider();
    when(mockHeadPhonesProvider.loadHeadPhones()).thenReturn(headPhonesList);

    _bloc = new HeadPhonesBloc.withMocks(mockHeadPhonesProvider);

    _bloc.headPhonesStream.listen((headPhone) {
      expect(headPhone, headPhonesList);
    });
    _bloc.loadHeadPhones();
  });

  test('load HeadPhones test when the list is null', () async {
    Future<List<HeadPhoneModel>> headPhonesList = null;

    final mockHeadPhonesProvider = MockHeadPhonesProvider();
    when(mockHeadPhonesProvider.loadHeadPhones()).thenReturn(headPhonesList);

    _bloc = new HeadPhonesBloc.withMocks(mockHeadPhonesProvider);

    _bloc.headPhonesStream.listen((headPhone) {
      expect(headPhone, null);
    });
    _bloc.loadHeadPhones();
  });
}
