import 'package:brigadapoli/src/ui/home_page.dart';
import 'package:brigadapoli/src/ui/profile_page.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';

class TapViewPage extends StatefulWidget {

  @override
  _TapViewPageState createState() => _TapViewPageState();
}

class _TapViewPageState extends State<TapViewPage> {

  int selectedIndex = 0;
  List<Widget> listWidgets = [HomePage(),ProfilePage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Brigada de emergencias'),
        backgroundColor: Color.fromRGBO(4, 75, 172, 1.0),
      ),
      body: listWidgets[selectedIndex],
      bottomNavigationBar: ConvexAppBar.badge({3: '21+'},
        items: [
          TabItem(icon: Icons.home, title: 'Home'),
          TabItem(icon: Icons.person_rounded, title: 'Profile'),
        ],
        onTap: onItemTapped,
        activeColor: Colors.white,
        backgroundColor: Color.fromRGBO(4, 75, 172, 1.0),
      ),
    );
  }

  void onItemTapped(int index){
    setState(() {
      selectedIndex = index;
    });
  }

}