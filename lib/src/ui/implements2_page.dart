import 'package:brigadapoli/src/ui/list_head_phones_page.dart';
import 'package:brigadapoli/src/ui/list_kits_page.dart';
import 'package:brigadapoli/src/ui/list_radios_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Implements2Page extends StatefulWidget {
  @override
  _Implements2PageState createState() => _Implements2PageState();
}

class _Implements2PageState extends State<Implements2Page> {
  int theriGroupValue = 0;

  final Map<int, Widget> pageWidgets = const <int, Widget>{
    0: Text(
      "Radios",
      style: TextStyle(
        color: Colors.black12,
        decoration: TextDecoration.none,
        fontSize: 20.0,
      ),
    ),
    1: Text(
      "Botiquínes",
      style: TextStyle(
        color: Colors.black12,
        decoration: TextDecoration.none,
        fontSize: 20.0,
      ),
    ),
    2: Text(
      "Audifonos",
      style: TextStyle(
        color: Colors.black12,
        decoration: TextDecoration.none,
        fontSize: 20.0,
      ),
    ),
  };

  List<Widget> bodies = [
    ListRadiosPage(),
    ListKitsPage(),
    ListHeadPhonesPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: _floatingActionButtonTapBodies(),
      body: bodies[theriGroupValue],
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: Size(double.infinity, 45.0),
          child: Padding(
            padding: EdgeInsets.only(top: 5.0,bottom: 10.0),
            child: Row(
              children: <Widget>[
                SizedBox(width: 15.0,),
                Expanded(
                  child: CupertinoSegmentedControl(
                    groupValue: theriGroupValue,
                    onValueChanged: (value) {
                      setState(() {
                        theriGroupValue = value;
                      });
                    },
                    children: pageWidgets,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ignore: missing_return
  Widget _floatingActionButtonTapBodies(){
    switch(theriGroupValue) {
      case 0: {
        return FloatingActionButton(
          child: Icon(
            Icons.add,
            color: Color.fromRGBO(4, 75, 172, 1.0),
          ),
          elevation: 10.0,
          backgroundColor: Colors.white,
          onPressed: () => Navigator.pushNamed(context, 'addRadios'),
        );
      }
      break;

      case 1: {
        return FloatingActionButton(
          child: Icon(
            Icons.add,
            color: Color.fromRGBO(4, 75, 172, 1.0),
          ),
          elevation: 10.0,
          backgroundColor: Colors.white,
          onPressed: () => Navigator.pushNamed(context, 'addkits'),
        );
      }
      break;

      case 2: {
        FloatingActionButton(
          child: Icon(
            Icons.add,
            color: Color.fromRGBO(4, 75, 172, 1.0),
          ),
          elevation: 10.0,
          backgroundColor: Colors.white,
          onPressed: () => Navigator.pushNamed(context, 'addHeadPhones'),
        );
      }
      break;
    }
  }

}
