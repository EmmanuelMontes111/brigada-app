
import 'package:brigadapoli/src/ui/home_page.dart';
import 'package:brigadapoli/src/ui/login_page.dart';
import 'package:flutter/material.dart';

import 'bloc/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: 'login',
        routes: {
          'login': (BuildContext context) => LoginPage(),
          'home': (BuildContext context) => HomePage(),
        },
          theme: ThemeData(
            primaryColor:  Color.fromRGBO(4, 75, 172, 1.0),
          ),
      ),
    );
  }
}
