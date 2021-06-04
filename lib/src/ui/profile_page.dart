import 'package:flutter/material.dart';
class ProfilePage extends StatefulWidget{

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Column(
        children: <Widget>[

          Column(mainAxisSize: MainAxisSize.max, children: <Widget>[
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ElevatedButton(
                      style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.white60)),
                      child: Text("Elija Un Botiquín",style: TextStyle(color: Colors.black26),),
                      onPressed: () {}),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ElevatedButton(
                      style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.white60)),
                      child: Text("Elija Un Botiquín",style: TextStyle(color: Colors.black26),),
                      onPressed: () {}),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ElevatedButton(
                      style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.white60)),
                      child: Text("Elija Un Botiquín",style: TextStyle(color: Colors.black26),),
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
                    value: true,
                    onChanged: (value) {
                      setState(() {});
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
    );
  }
}