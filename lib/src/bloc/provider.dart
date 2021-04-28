
import 'package:flutter/material.dart';

import 'login_bloc.dart';

class Provider extends InheritedWidget {

  static Provider _instanceProvider;
  factory Provider({Key key, Widget child}){
    if(_instanceProvider == null){
      _instanceProvider =  new Provider._internal(key: key, child: child,);
    }
    return _instanceProvider;
  }

  Provider._internal({Key key, Widget child})
      : super(key: key,child: child);

  final loginBloc = LoginBloc();

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;

  static LoginBloc of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Provider>().loginBloc;
  }
}
