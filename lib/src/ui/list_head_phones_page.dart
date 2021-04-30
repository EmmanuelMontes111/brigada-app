import 'package:brigadapoli/src/bloc/provider.dart';
import 'package:brigadapoli/src/models/head_phone_model.dart';
import 'package:brigadapoli/src/providers/head_phones_provider.dart';
import 'package:flutter/material.dart';

class ListHeadPhonesPage extends StatelessWidget {
  final headPhonesProvider = new HeadPhonesProvider();

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);

    return Container(
      child: Container(child:
        _createList(),
      ),
    );
  }

  Widget _createList() {
    return FutureBuilder(
        future: headPhonesProvider.loadHeadPhones(),
        builder: (BuildContext context,
            AsyncSnapshot<List<HeadPhoneModel>> snapshot) {
          if (snapshot.hasData) {
            final headPhones = snapshot.data;
            return ListView.builder(
                itemCount: headPhones.length,
                itemBuilder: (context, i) => _crearItem(context, headPhones[i]));
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }

  Widget _crearItem(BuildContext context, HeadPhoneModel headPhone) {
    return Dismissible(
      key: UniqueKey(),
      background: Container(
        color: Colors.redAccent,
      ),
      onDismissed: (direction){
      },
      child: ListTile(
      title: Text('${headPhone.name}'),
      subtitle: Text('${headPhone.id}'),
        onTap: () => Navigator.pushNamed(context, 'addHeadPhones'),
      ),
    );
  }

}
