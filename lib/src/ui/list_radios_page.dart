import 'package:brigadapoli/src/bloc/provider.dart';
import 'package:brigadapoli/src/bloc/radios_bloc.dart';
import 'package:brigadapoli/src/models/radio_model.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ListRadiosPage extends StatelessWidget {
  bool isDelete = false;

  @override
  Widget build(BuildContext context) {
    final radiosBloc = Provider.radioBloc(context);
    radiosBloc.loadRadios();

    return Container(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20.0),
        child: Container(
          child: _createList(radiosBloc),
        ),
      ),
    );
  }

  Widget _createList(RadiosBloc radiosBloc) {
    return StreamBuilder(
        stream: radiosBloc.radiosStream,
        builder: (BuildContext context, AsyncSnapshot<List<RadioModel>> snapshot) {
          if (snapshot.hasData) {
            final radios = snapshot.data;
            return ListView.builder(
                itemCount: radios.length,
                itemBuilder: (context, i) => _crearItem(context,radiosBloc, radios[i]));
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }

  Widget _crearItem(BuildContext context, RadiosBloc radiosBloc, RadioModel radio) {
    return Dismissible(
      key: UniqueKey(),
      background: Container(
        color: Colors.redAccent,
      ),
      onDismissed: (direction) {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text(
                  'ELIMINAR',
                  style: TextStyle(color: Colors.red, fontSize: 20.0),
                ),
                content: Text('¿Esta segur@ de ELIMINAR el ${radio.name}'),
                actions: [
                  TextButton(
                    child: Text("Cancelar"),
                    onPressed: () {
                      isDelete = false;
                      Navigator.pop(context);
                    },
                  ),
                  TextButton(
                    child: Text("Aceptar"),
                    onPressed: () {
                      isDelete = true;
                      radiosBloc.deleteRadio(radio.idFirebase);
                      Navigator.pop(context);
                    },
                  ),
                ],
              );
            });
      },
      child: ListTile(
        title: Text('${radio.name}'),
        subtitle: Text('${radio.id}'),
        onTap: () =>
            Navigator.pushNamed(context, 'addRadios', arguments: radio),
      ),
    );
  }
}
