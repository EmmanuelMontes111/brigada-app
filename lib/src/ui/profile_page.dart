import 'package:brigadapoli/src/services_firebaase/global_firebase.dart';
import 'package:brigadapoli/src/services_firebaase/update_data_firebase.dart';
import 'package:brigadapoli/src/ui/widgets/curve_painter.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 28.0),
        child: Column(
          children: <Widget>[
            topBar(),
            Column(mainAxisSize: MainAxisSize.max, children: <Widget>[
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.white60)),
                        child: Text(
                          "Elija Un Botiquín",
                          style: TextStyle(color: Colors.black26),
                        ),
                        onPressed: () {}),
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.white60)),
                        child: Text(
                          "Elija Un Botiquín",
                          style: TextStyle(color: Colors.black26),
                        ),
                        onPressed: () {}),
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.white60)),
                        child: Text(
                          "Elija Un Botiquín",
                          style: TextStyle(color: Colors.black26),
                        ),
                        onPressed: () {}),
                  ),
                ],
              ),
            ]),
            Row(
              children: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.edit,
                    color: Colors.black,
                  ),
                  onPressed: () {},
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    padding: const EdgeInsets.only(left: 220.0),
                    child: Switch(
                      value: Global.brigadista.activationStatus,
                      onChanged: (value) {
                        setState(() {
                          Global.brigadista.activationStatus = value;
                        });
                        UpdateDataFirebase().updateData(Global.brigadista);
                      },
                      activeTrackColor: Colors.lightGreenAccent,
                      activeColor: Colors.green,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Container topBar() {
  return Container(
    child: CustomPaint(
      child: Container(
        height: 210.0,
        margin: EdgeInsets.only(top: 5.0, left: 10.0, right: 20.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 10.0, left: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[],
              ),
            ),
            Row(
              children: <Widget>[
                Container(
                  width: 90,
                  height: 90,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/img/profile_photo.png'),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '${Global.brigadista.name} ${Global.brigadista.lastName}',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '${Global.brigadista.movil}',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      painter: CurvePainter(),
    ),
  );
}
