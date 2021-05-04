import 'package:brigadapoli/src/models/head_phone_model.dart';
import 'package:brigadapoli/src/providers/head_phones_provider.dart';
import 'package:brigadapoli/src/utils/utils.dart' as utils;
import 'package:flutter/material.dart';

class AddHeadPhonesPage extends StatefulWidget {
  @override
  _AddHeadPhonesPageState createState() => _AddHeadPhonesPageState();
}

class _AddHeadPhonesPageState extends State<AddHeadPhonesPage> {
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final headPhoneProvider = new HeadPhonesProvider();

  HeadPhoneModel headPhone = new HeadPhoneModel();

  @override
  Widget build(BuildContext context) {

    final HeadPhoneModel headPhoneData = ModalRoute.of(context).settings.arguments;

    if(headPhoneData != null) {
      headPhone = headPhoneData;
    }

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text("Agregar Audifono"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.photo_size_select_actual),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.camera_alt),
            onPressed: () {},
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15.0),
          child: Container(
            padding: EdgeInsets.all(15.0),
            child: Form(
              key: formKey,
              child: Column(
                children: <Widget>[
                  _creteId(),
                  _creteName(),
                  _creteAvailable(),
                  _creteButton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _creteId() {
    return TextFormField(
      initialValue: headPhone.id.toString(),
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: 'Id del Audifono',
      ),
      onSaved: (value) => headPhone.id = value,
      validator: (value) {
        if (utils.isNumeric(value)) {
          return null;
        } else {
          return 'Sólo números';
        }
      },
    );
  }

  Widget _creteName() {
    return TextFormField(
      initialValue: headPhone.name.toString(),
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        labelText: 'Nombre del Audifono',
      ),
      onSaved: (value) => headPhone.name = value,
      validator: (value) {
        if (value.length < 3) {
          return 'Ingrese el nombre del Audifono';
        } else {
          return null;
        }
      },
    );
  }

  Widget _creteAvailable() {
    return Row(
      children: <Widget>[
        Text("Disponible"),
        SizedBox(
          width: 200.0,
          height: 50.0,
        ),
        headPhone.available
            ? Icon(Icons.album_outlined, color: Colors.green)
            : Icon(Icons.circle, color: Colors.red),
      ],
    );
  }

  Widget _creteButton() {
    return ElevatedButton.icon(
      label: Text('Guardar'),
      icon: Icon(Icons.save),
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        )),
        backgroundColor:
            MaterialStateProperty.all(Color.fromRGBO(4, 75, 172, 1.0)),
        elevation: MaterialStateProperty.all(0.0),
      ),
      onPressed: _submit,
    );
  }

  void _submit() {
    if (!formKey.currentState.validate()) {
      return;
    }
    formKey.currentState.save();

    print(headPhone.id);
    print(headPhone.name);

    if(headPhone.idFirebase == null){
      headPhoneProvider.createHeadPhone(headPhone);
    }
    else{headPhoneProvider.editHeadPhone(headPhone);
    }
    viewSnackbar("Registro Guardado");
  }

  void viewSnackbar(String message) {
    final snackbar = SnackBar(
      content: Text(message),
      duration: Duration(milliseconds: 1500),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
    // scaffoldKey.currentState.showSnackBar(snackbar);
  }
}
