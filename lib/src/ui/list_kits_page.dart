import 'package:brigadapoli/src/bloc/kits_bloc.dart';
import 'package:brigadapoli/src/bloc/provider.dart';
import 'package:brigadapoli/src/models/kit_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// ignore: must_be_immutable
class ListKitsPage extends StatelessWidget{

  bool isDelete = false;
  @override
  Widget build(BuildContext context) {
    final kitsBloc = Provider.kitsBloc(context);
    kitsBloc.loadKits();

    return Container(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20.0),
        child: Container(
          child: _createList(kitsBloc),
        ),
      ),
    );
  }

  Widget _createList(KitsBloc kitsBloc) {
    return StreamBuilder(
        stream: kitsBloc.kitsStream,
        builder: (BuildContext context, AsyncSnapshot<List<KitModel>> snapshot) {
          if (snapshot.hasData) {
            final kits = snapshot.data;
            return ListView.builder(
                itemCount: kits.length,
                itemBuilder: (context, i) => _crearItem(context, kitsBloc, kits[i]));
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
    );
  }

  Widget _crearItem(BuildContext context, KitsBloc kitsBloc, KitModel kit) {
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
                  style:
                  TextStyle(color: Colors.red, fontSize: 20.0),
                ),
                content: Text(
                    '¿Esta segur@ de ELIMINAR el ${kit.name}'),
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
                      kitsBloc.deletekits(kit.idFirebase);
                      Navigator.pop(context);
                    },
                  ),
                ],
              );
            });
      },

      child: ListTile(
        title: Text('${kit.name}'),
        subtitle: Text('${kit.id}'),
        onTap: () => Navigator.pushNamed(context, 'addkits', arguments: kit),
      ),
    );
  }
}
