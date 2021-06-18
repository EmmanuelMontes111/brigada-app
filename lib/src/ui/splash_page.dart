import 'dart:async';
import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  bool active = false;
  bool initialized = false;
  bool error = false;

  @override
  void initState() {
    super.initState();
    initializerFlutterFire();
    Timer(Duration(seconds: 3), retry);
    // retry();
  }

  void retry() {
 //   verifyAuth();
    goToLogin();
  }

  @override
  Widget build(BuildContext context) {
    if (error) {
      return Scaffold(
        body: Center(
          child: Text("Error"),
        ),
      );
    }

    if (!initialized) {
      return Scaffold(
        body: Center(
          child: Text("Cargando"),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Image.asset('assets/img/medium_logo.png'),
          ),
        ],
      ),
    );
  }

  Future<void> goToLogin() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        print('connected');

        Navigator.pushReplacementNamed(context, 'login');
      }
    } on SocketException catch (_) {
      print('not connected');
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text(
                'Sin Internet',
                style: TextStyle(color: Colors.red, fontSize: 20.0),
              ),
              content: Text(
                  'No es posible conectar a BrigadaApp, verifica tu conexión a internet e intenta nuevamente.'),
              actions: [
                TextButton(
                  child: Text("Reintentar"),
                  onPressed: () {
                    Navigator.pop(context);
                    retry();
                    },
                ),
              ],
            );
          });
    }
  }

  Future<void> goToHomePage() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        print('connected');
        Navigator.pushReplacementNamed(context, 'viewPages');
      }
    } on SocketException catch (_) {
      print('not connected');
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text(
                'Sin Internet',
                style: TextStyle(color: Colors.red, fontSize: 20.0),
              ),
              content: Text(
                  'No es posible conectar a BrigadaApp, verifica tu conexión a internet e intenta nuevamente.'),
              actions: [
                TextButton(
                  child: Text("Reintentar"),
                  onPressed: () {
                    Navigator.pop(context);
                    retry();
                  },
                ),
              ],
            );
          });

      // showCustomAlert(
      //   icon: Icons.signal_wifi_off,
      //   color: Colors.red,
      //   message: l10n.messageNoInternet,
      //   title: l10n.noInternet,
      //   positiveTextButton: (isUserLocked ?? false) ? l10n.unlock : l10n.retry,
      //   positiveOnPressed: () {
      //     (isUserLocked ?? false)
      //         ? Text("error")
      //         : (Navigator.of(context).pop());
      //     retry();
      //   },
      //   negativeTextButton: (isUserLocked ?? false) ? l10n.unlock : l10n.exit,
      //   negativeOnPressed: () {
      //     (isUserLocked ?? false) ? Text("error") : exit(0);
      //   },
      // );
    }
  }

  initializerFlutterFire() async {
    try {
      await Firebase.initializeApp();
      setState(() {
        initialized = true;
      });
    } catch (e) {
      print(e);
      setState(() {
        initialized = true;
      });
    }
  }
}
