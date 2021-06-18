import 'package:brigadapoli/src/%20user_preferences/user_preferences.dart';
import 'package:brigadapoli/src/bloc/provider.dart';
import 'package:brigadapoli/src/ui/add_head_phones_page.dart';
import 'package:brigadapoli/src/ui/add_kits_page.dart';
import 'package:brigadapoli/src/ui/add_radios_page.dart';
import 'package:brigadapoli/src/ui/home_page.dart';
import 'package:brigadapoli/src/ui/implements_page.dart';
import 'package:brigadapoli/src/ui/login_page.dart';
import 'package:brigadapoli/src/ui/register_page.dart';
import 'package:brigadapoli/src/ui/splash_page.dart';
import 'package:brigadapoli/src/ui/tap_view_page.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final preferences = new UserPreferences();
  await preferences.initPrefs();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final preferences = new UserPreferences();
    print(preferences.token);

    return Provider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: 'splash',
        routes: {
          'login': (BuildContext context) => LoginPage(),
          'viewPages': (BuildContext context) => TapViewPage(),
          'home': (BuildContext context) => HomePage(),
          'implements': (BuildContext context) => ImplementsPage(),
          'addHeadPhones': (BuildContext context) => AddHeadPhonesPage(),
          'addkits': (BuildContext context) => AddKitsPage(),
          'addRadios': (BuildContext context) => AddRadiosPage(),
          'register': (BuildContext context) => RegisterPage(),
          'splash': (BuildContext context) => SplashPage(),
        },
        theme: ThemeData(
          primaryColor: Color.fromRGBO(4, 75, 172, 1.0),
        ),
      ),
    );
  }
}
