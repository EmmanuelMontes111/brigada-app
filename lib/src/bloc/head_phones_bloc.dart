import 'package:brigadapoli/src/models/head_phone_model.dart';
import 'package:brigadapoli/src/providers/head_phones_provider.dart';
import 'package:rxdart/rxdart.dart';

class HeadPhonesBloc {
  final _headPhoneController = new BehaviorSubject<List<HeadPhoneModel>>();
  final _loadController = new BehaviorSubject<bool>();

  HeadPhonesProvider _headPhonesProvider;

  Stream<List<HeadPhoneModel>> get headPhonesStream =>
      _headPhoneController.stream;

  Stream<bool> get loadStream => _loadController.stream;

  HeadPhonesBloc(){
    this._headPhonesProvider = new  HeadPhonesProvider();
  }

  HeadPhonesBloc.withMocks(this._headPhonesProvider);

  void loadHeadPhones() async {
    final headPhones = await _headPhonesProvider.loadHeadPhones();
    _headPhoneController.sink.add(headPhones);
  }

  void addHeadPhone(HeadPhoneModel headPhone) async {
    _loadController.sink.add(true);
    await _headPhonesProvider.createHeadPhone(headPhone);
    _loadController.sink.add(false);
  }

  void editHeadPhone(HeadPhoneModel headPhone) async {
    _loadController.sink.add(true);
    await _headPhonesProvider.editHeadPhone(headPhone);
    _loadController.sink.add(false);
  }

  void deleteHeadPhone(String id) async {
    _loadController.sink.add(true);
    await _headPhonesProvider.deleteHeadPhones(id);
    _loadController.sink.add(false);
  }

  dispose() {
    _headPhoneController?.close();
    _loadController?.close();
  }
}
