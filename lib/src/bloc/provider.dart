import 'package:flutter/material.dart';

import 'login_bloc.dart';

import 'package:brigadapoli/src/bloc/head_phones_bloc.dart';
export 'package:brigadapoli/src/bloc/head_phones_bloc.dart';

class Provider extends InheritedWidget {

  final loginBloc = new LoginBloc();
  final _headPhoneBloc = new HeadPhonesBloc();

  static Provider _instanceProvider;
  factory Provider({Key key, Widget child}){
    if(_instanceProvider == null){
      _instanceProvider =  new Provider._internal(key: key, child: child,);
    }
    return _instanceProvider;
  }

  Provider._internal({Key key, Widget child})
      : super(key: key,child: child);



  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;

  static LoginBloc of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Provider>().loginBloc;
  }

  static HeadPhonesBloc headPhoneBloc (BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Provider>()._headPhoneBloc;
  }
}
