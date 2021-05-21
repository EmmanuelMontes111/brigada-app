import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

bool isNumeric(String string) {
  if (string.isEmpty) return false;

  final numeric = num.tryParse(string);

  return (numeric == null) ? false : true;
}

void viewAlert(BuildContext context, String message) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Informacion Incorrecta'),
          content: Text('Por Favor vuelva a intentarlo'),
          actions: <Widget>[
            TextButton(
              child: Text('Ok'),
              onPressed: () => Navigator.of(context).pop(),
            )
          ],
        );
      });
}
