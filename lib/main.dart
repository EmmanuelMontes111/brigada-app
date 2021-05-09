import 'package:brigadapoli/src/bloc/provider.dart';
import 'package:brigadapoli/src/ui/add_head_phones_page.dart';
import 'package:brigadapoli/src/ui/add_kits_page.dart';
import 'package:brigadapoli/src/ui/home_page.dart';
import 'package:brigadapoli/src/ui/implements2_page.dart';
import 'package:brigadapoli/src/ui/implements_page.dart';
import 'package:brigadapoli/src/ui/login_page.dart';
import 'package:brigadapoli/src/ui/tap_view_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: 'implements2',
        routes: {
          'login': (BuildContext context) => LoginPage(),
          'viewPages': (BuildContext context) => TapViewPage(),
          'home': (BuildContext context) => HomePage(),
          'implements': (BuildContext context) => ImplementsPage(),
          'addHeadPhones': (BuildContext context) => AddHeadPhonesPage(),
          'addkits': (BuildContext context) => AddKitsPage(),
          'implements2': (BuildContext context) => Implements2Page(),
        },
        theme: ThemeData(
          primaryColor: Color.fromRGBO(4, 75, 172, 1.0),
        ),
      ),
    );
  }
}
