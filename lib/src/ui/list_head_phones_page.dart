import 'package:flutter/material.dart';

class ListHeadPhonesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        child: _creteButton(context),
      ),
    );
  }

  Widget _creteButton(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 350.0, left: 285.0),
          child: FloatingActionButton(
            child: Icon(
              Icons.add,
              color: Color.fromRGBO(4, 75, 172, 1.0),
            ),
            elevation: 10.0,
            backgroundColor: Colors.white,
            onPressed: () => Navigator.pushNamed(context, 'addHeadPhones'),
          ),
        ),
      ],
    );
  }
}
