import 'package:flutter/material.dart';

import 'list_head_phones_page.dart';
import 'list_kits_page.dart';
import 'list_radios_page.dart';

// ignore: must_be_immutable
class ImplementsPage extends StatelessWidget {

  Map<String, Widget> tabsIcons = {
    'Radio': CircleAvatar(
      backgroundColor: Colors.white,
      child: Icon(Icons.radio),
    ),
    'Botiquin': CircleAvatar(
      backgroundColor: Colors.white,
      child: Icon(Icons.work),
    ),
    'Audifonos': CircleAvatar(
      backgroundColor: Colors.white,
      child: Icon(Icons.headset_mic_rounded),
    ),
  };

  @override
  Widget build(BuildContext context) {
    return tabBarWidget();
  }

  Widget tabBarWidget() {
    List<Tab> androidTabs = [];
    tabsIcons.forEach((key, value) {
      androidTabs.add(
        Tab(
          icon: value,
          text: key,
        ),
      );
    });
    return DefaultTabController(
      length: tabsIcons.length,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            indicatorColor: Colors.white,
            labelStyle: TextStyle(fontSize: 16.0),
            unselectedLabelStyle: TextStyle(fontSize: 14),
            tabs: androidTabs,
            isScrollable: true,
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            ListRadiosPage(),
            ListKitsPage(),
            ListHeadPhonesPage(),
          ],
        ),
      ),
    );
  }
}
