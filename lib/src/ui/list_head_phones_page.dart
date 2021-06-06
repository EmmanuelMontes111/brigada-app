import 'package:brigadapoli/src/bloc/provider.dart';
import 'package:brigadapoli/src/models/head_phone_model.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ListHeadPhonesPage extends StatelessWidget {
  bool isDelete = false;

  @override
  Widget build(BuildContext context) {
    final headPhoneBloc = Provider.headPhoneBloc(context);
    headPhoneBloc.loadHeadPhones();

    return Container(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20.0),
        child: Container(
          child: _createList(headPhoneBloc),
        ),
      ),
    );
  }

  Widget _createList(HeadPhonesBloc headPhonesBloc) {
    return StreamBuilder(
      stream: headPhonesBloc.headPhonesStream,
      builder:
          (BuildContext context, AsyncSnapshot<List<HeadPhoneModel>> snapshot) {
        if (snapshot.hasData) {
          final headPhones = snapshot.data;
          return ListView.builder(
              itemCount: headPhones.length,
              itemBuilder: (context, i) => _crearItem(context, headPhonesBloc, headPhones[i]));
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Widget _crearItem(BuildContext context,HeadPhonesBloc headPhonesBloc, HeadPhoneModel headPhone) {
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
                content: Text('¿Esta segur@ de ELIMINAR el ${headPhone.name}'),
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
                      headPhonesBloc.deleteHeadPhone(headPhone.idFirebase);
                      Navigator.pop(context);
                    },
                  ),
                ],
              );
            });
      },
      child: ListTile(
        title: Text('${headPhone.name}'),
        subtitle: Text('${headPhone.id}'),
        onTap: () =>
            Navigator.pushNamed(context, 'addHeadPhones', arguments: headPhone),
      ),
    );
  }
}
