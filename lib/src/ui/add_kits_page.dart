import 'package:brigadapoli/src/bloc/kits_bloc.dart';
import 'package:brigadapoli/src/bloc/provider.dart';
import 'package:brigadapoli/src/models/kit_model.dart';
import 'package:brigadapoli/src/utils/utils.dart' as utils;
import 'package:flutter/material.dart';

class AddKitsPage extends StatefulWidget {
  @override
  _AddKitsPageState createState() => _AddKitsPageState();
}

class _AddKitsPageState extends State<AddKitsPage> {
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  KitsBloc kitsBloc;
  KitModel kit = new KitModel();

  @override
  Widget build(BuildContext context) {

    kitsBloc = Provider.kitsBloc(context);

    final KitModel kitData = ModalRoute.of(context).settings.arguments;

    if(kitData != null) {
      kit = kitData;
    }

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text("Agregar Botiquín"),
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
      initialValue: kit.id.toString(),
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: 'Id del Botiquín',
      ),
      onSaved: (value) => kit.id = value,
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
      initialValue: kit.name.toString(),
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        labelText: 'Nombre del Botiquín',
      ),
      onSaved: (value) => kit.name = value,
      validator: (value) {
        if (value.length < 3) {
          return 'Ingrese el nombre del Botiquín';
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
        kit.available
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

    print(kit.id);
    print(kit.name);

    if(kit.idFirebase == null){
      kitsBloc.addkits(kit);
    }
    else{kitsBloc.editkits(kit);
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
