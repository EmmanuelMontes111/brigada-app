import 'package:brigadapoli/src/models/kit_model.dart';
import 'package:brigadapoli/src/providers/kit_provider.dart';
import 'package:flutter/material.dart';
class ListKitsPage extends StatelessWidget{
  final kitsProvider = new KitsProvider();
  bool isDelete = false;
  @override
  Widget build(BuildContext context) {

    return Container(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20.0),
        child: Container(child:
        _createList(),
        ),
      ),
    );
  }

  Widget _createList() {
    return FutureBuilder(
        future: kitsProvider.loadkits(),
        builder: (BuildContext context,
            AsyncSnapshot<List<KitModel>> snapshot) {
          if (snapshot.hasData) {
            final kits = snapshot.data;
            return ListView.builder(
                itemCount: kits.length,
                itemBuilder: (context, i) => _crearItem(context, kits[i]));
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }

  Widget _crearItem(BuildContext context, KitModel kit) {
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
                      kitsProvider.deleteKits(kit.idFirebase);
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
