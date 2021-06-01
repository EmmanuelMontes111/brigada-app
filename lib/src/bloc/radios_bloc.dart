import 'package:brigadapoli/src/models/radio_model.dart';
import 'package:brigadapoli/src/providers/radio_provider.dart';
import 'package:rxdart/rxdart.dart';

class RadiosBloc {
  final _radioController = new BehaviorSubject<List<RadioModel>>();
  final _loadController = new BehaviorSubject<bool>();

  RadiosProvider _radiosProvider;

  Stream<List<RadioModel>> get headPhonesStream => _radioController.stream;

  Stream<bool> get loadStream => _loadController.stream;

  RadiosBloc() {
    this._radiosProvider = new RadiosProvider();
  }

  RadiosBloc.withMocks(this._radiosProvider);

  void loadRadios() async {
    final radios = await _radiosProvider.loadRadios();
    _radioController.sink.add(radios);
  }

  void addRadios(RadioModel radio) async {
    _loadController.sink.add(true);
    await _radiosProvider.createRadio(radio);
    _loadController.sink.add(false);
  }

  dispose() {
    _radioController?.close();
    _loadController?.close();
  }
}
