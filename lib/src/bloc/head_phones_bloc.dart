import 'package:brigadapoli/src/models/head_phone_model.dart';
import 'package:brigadapoli/src/providers/head_phones_provider.dart';
import 'package:rxdart/rxdart.dart';

class HeadPhonesBloc {
  final _headPhoneController = new BehaviorSubject<List<HeadPhoneModel>>();
  final _loadController = new BehaviorSubject<bool>();

  final _headPhonesProvider = new HeadPhonesProvider();

  Stream<List<HeadPhoneModel>> get headPhonesStream =>
      _headPhoneController.stream;

  Stream<bool> get loadStream => _loadController.stream;

  void loadHeadPhones() async {
    final headPhones = await _headPhonesProvider.loadHeadPhones();
    _headPhoneController.sink.add(headPhones);
  }

  dispose() {
    _headPhoneController?.close();
    _loadController?.close();
  }
}
