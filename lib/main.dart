
import 'package:brigadapoli/src/bloc/provider.dart';
import 'package:brigadapoli/src/ui/home_page.dart';
import 'package:brigadapoli/src/ui/list_brigadistas_page.dart';
import 'package:brigadapoli/src/ui/login_page.dart';
import 'package:flutter/material.dart';



void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: 'list',
        routes: {
          'login': (BuildContext context) => LoginPage(),
          'home': (BuildContext context) => HomePage(),
          'list': (BuildContext context) => ListBrigasdistasPage(),
        },
          theme: ThemeData(
            primaryColor:  Color.fromRGBO(4, 75, 172, 1.0),
          ),
      ),
    );
  }
}
