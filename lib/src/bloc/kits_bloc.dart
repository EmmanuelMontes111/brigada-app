import 'package:brigadapoli/src/models/head_phone_model.dart';
import 'package:brigadapoli/src/models/kit_model.dart';
import 'package:brigadapoli/src/models/kit_model.dart';
import 'package:brigadapoli/src/models/kit_model.dart';
import 'package:brigadapoli/src/models/kit_model.dart';
import 'package:brigadapoli/src/providers/head_phones_provider.dart';
import 'package:brigadapoli/src/providers/kit_provider.dart';
import 'package:rxdart/rxdart.dart';

class KitsBloc {
  final _kitController = new BehaviorSubject<List<KitModel>>();
  final _loadController = new BehaviorSubject<bool>();

  KitsProvider _kitsProvider;

  Stream<List<KitModel>> get kitsStream =>
      _kitController.stream;

  Stream<bool> get loadStream => _loadController.stream;

  KitsBloc(){
    this._kitsProvider = new  KitsProvider();
  }


  dispose() {
    _kitController?.close();
    _loadController?.close();
  }
}
