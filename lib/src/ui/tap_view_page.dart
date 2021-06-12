import 'package:brigadapoli/src/ui/home_page.dart';
import 'package:brigadapoli/src/ui/implements_page.dart';
import 'package:brigadapoli/src/ui/profile_page.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class TapViewPage extends StatefulWidget {

  @override
  _TapViewPageState createState() => _TapViewPageState();
}

class _TapViewPageState extends State<TapViewPage> {
  bool initialized = false;
  int selectedIndex = 1;
  List<Widget> listWidgets = [ImplementsPage(),HomePage(),ProfilePage()];

  @override
  void initState() {
    super.initState();
    initializerFlutterFire();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: listWidgets[selectedIndex],
      bottomNavigationBar: ConvexAppBar.badge({2: '21+'},
        items: [
          TabItem(icon: Icons.list, title: 'Implements'),
          TabItem(icon: Icons.home, title: 'Home'),
          TabItem(icon: Icons.person_rounded, title: 'Profile'),
        ],
        initialActiveIndex: 1,
        onTap: onItemTapped,
        activeColor: Colors.white,
        backgroundColor: Color.fromRGBO(4, 75, 172, 1.0),
      ),
    );
  }

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  // ignore: missing_return
  // Widget _appBarSelectIndex(){
  //   switch(selectedIndex) {
  //     case 0: {
  //      return AppBar(
  //         title: Text('Implementos'),
  //         backgroundColor: Color.fromRGBO(4, 75, 172, 1.0),
  //       );
  //     }
  //     break;
  //
  //     case 1: {
  //       return AppBar(
  //         title: Text('Brigadistas'),
  //         backgroundColor: Color.fromRGBO(4, 75, 172, 1.0),
  //       );
  //     }
  //     break;
  //
  //     case 2: {
  //       AppBar(
  //         title: Text('Mi Perfil'),
  //         backgroundColor: Color.fromRGBO(4, 75, 172, 1.0),
  //       );
  //     }
  //     break;
  //   }
  // }

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