import 'package:flutter/material.dart';

class ListBrigasdistasPage extends StatefulWidget {
  @override
  _ListBrigasdistasPageState createState() => _ListBrigasdistasPageState();
}

class _ListBrigasdistasPageState extends State<ListBrigasdistasPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Brigadistas'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
              })
        ],
        backgroundColor: Colors.indigo,
      ),
    );
  }
}
