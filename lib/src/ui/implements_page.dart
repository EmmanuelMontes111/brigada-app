import 'package:flutter/material.dart';

import 'list_head_phones_page.dart';
import 'list_kits_page.dart';
import 'list_radios_page.dart';

// ignore: must_be_immutable
class ImplementsPage extends StatefulWidget {
  @override
  _ImplementsPageState createState() => _ImplementsPageState();
}

class _ImplementsPageState extends State<ImplementsPage> {
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

  Widget _floatingActionButton;

  @override
  Widget build(BuildContext context) {
    List<Tab> androidTabs = [];
    tabsIcons.forEach((key, value) {
      androidTabs.add(
        Tab(
          icon: value,
          text: key,
        ),
      );
    });

    _floatingActionButton = FloatingActionButton(
      child: Icon(
        Icons.add,
        color: Color.fromRGBO(4, 75, 172, 1.0),
      ),
      elevation: 10.0,
      backgroundColor: Colors.white,
      onPressed: () => Navigator.pushNamed(context, 'addkits'),
    );

    return DefaultTabController(
      length: tabsIcons.length,
      child: Scaffold(
        floatingActionButton: _floatingActionButton,
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
            _listRadioPage(context),
            _listKitsPage(context),
            _listHeadPhonesPag(context),
          ],
        ),
      ),
    );
  }

  Widget _listRadioPage(BuildContext context) {
    setState(() {
      _floatingActionButton = FloatingActionButton(
        child: Icon(
          Icons.add,
          color: Color.fromRGBO(4, 75, 172, 1.0),
        ),
        elevation: 10.0,
        backgroundColor: Colors.white,
        onPressed: () => Navigator.pushNamed(context, 'addHeadPhones'),
      );
    });
    return ListRadiosPage();
  }

  Widget _listKitsPage(BuildContext context) {
    setState(() {
      _floatingActionButton = FloatingActionButton(
        child: Icon(
          Icons.add,
          color: Color.fromRGBO(4, 75, 172, 1.0),
        ),
        elevation: 10.0,
        backgroundColor: Colors.white,
        onPressed: () => Navigator.pushNamed(context, 'addkits'),
      );
    });

    return ListKitsPage();
  }

  Widget _listHeadPhonesPag(BuildContext context) {
    setState(() {
      _floatingActionButton = FloatingActionButton(
        child: Icon(
          Icons.add,
          color: Color.fromRGBO(4, 75, 172, 1.0),
        ),
        elevation: 10.0,
        backgroundColor: Colors.white,
        onPressed: () => Navigator.pushNamed(context, 'addHeadPhones'),
      );
    });
    return ListHeadPhonesPage();
  }
}
