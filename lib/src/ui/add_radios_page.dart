import 'package:brigadapoli/src/models/radio_model.dart';
import 'package:brigadapoli/src/providers/radio_provider.dart';
import 'package:brigadapoli/src/utils/utils.dart' as utils;
import 'package:flutter/material.dart';

class AddRadiosPage extends StatefulWidget {
  @override
  _AddRadiosPageState createState() => _AddRadiosPageState();
}

class _AddRadiosPageState extends State<AddRadiosPage> {
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final radioProvider = new RadiosProvider();

  RadioModel radio = new RadioModel();

  @override
  Widget build(BuildContext context) {

    final RadioModel radioData = ModalRoute.of(context).settings.arguments;

    if(radioData != null) {
      radio = radioData;
    }

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text("Agregar Radio"),
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
      initialValue: radio.id.toString(),
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: 'Id del Radio',
      ),
      onSaved: (value) => radio.id = value,
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
      initialValue: radio.name.toString(),
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        labelText: 'Nombre del Radio',
      ),
      onSaved: (value) => radio.name = value,
      validator: (value) {
        if (value.length < 3) {
          return 'Ingrese el nombre del Radio';
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
        radio.available
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

    print(radio.id);
    print(radio.name);

    if(radio.idFirebase == null){
      radioProvider.createRadio(radio);
    }
    else{radioProvider.editRadio(radio);
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
