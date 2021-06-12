import 'package:brigadapoli/src/models/user_model.dart';
import 'package:brigadapoli/src/services_firebaase/global_firebase.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() {
    // TODO: implement createState
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {

  UserModel _brigadista;

  HomePageState() {
    _brigadista = Global.doc;
  }

  final _db = FirebaseFirestore.instance;
  String name;
  List<UserModel> listUsers;
  final TextEditingController _controller = TextEditingController();
  bool _isSearching;
  Widget _users;

  @override
  void initState() {
    super.initState();
    _isSearching = false;
    _users = SizedBox();
    readDataBase();
    listUsers = List<UserModel>();

  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget appBarTitle = Text(
    "Brigadistas",
    style: TextStyle(color: Colors.white),
  );

  Icon iconSearch = Icon(
    Icons.search,
    color: Colors.white,
  );

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: appBarTitle,
        actions: <Widget>[
          IconButton(
              icon: iconSearch,
              onPressed: () {
                setState(() {
                  if (this.iconSearch.icon == Icons.search) {
                    this.iconSearch = Icon(
                      Icons.close,
                      color: Colors.white,
                    );
                    this.appBarTitle = TextField(
                      controller: _controller,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      decoration: InputDecoration(
                          hintText: "Buscar un brigadista...",
                          hintStyle: TextStyle(color: Colors.white),
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.white,
                          )),
                      onChanged: searchOperation,
                    );
                    _handleSearchStart();
                  } else {
                    searchOperation(null);
                    _handleSearchEnd();
                  }
                });
              })
        ],
        backgroundColor: Colors.indigo,
      ),
      body: ListView(
        children: <Widget>[
          _users
        ],
      ),
    );
  }

  Container buildItem(UserModel doc) {
    return Container(
        height: 120.0,
        margin: const EdgeInsets.symmetric(
          vertical: 5.0,
          horizontal: 15.0,
        ),
        child: Stack(
          children: <Widget>[
            card(doc),
            // viewImage(doc),
          ],
        ));
  }

  void readDataBase() {
    setState(() {
      Stream<QuerySnapshot> qs = _db.collection("Users")
          .orderBy("name", descending: false).snapshots();
      qs.listen((QuerySnapshot onData) => {
        listUsers = [],
        onData.docs
            .map((doc) => {
          listUsers.add(UserModel(
            id: doc.data()['id'],
            email: doc.id,
            name: doc.data()['name'],
            lastName: doc.data()['lastName'],
            // image: doc.data()['image'],
            movil: doc.data()['movil'],
            activationStatus: doc.data()['activationStatus'],
            positionRHlist: doc.data()['positionRHlist'],
            rh: doc.data()['rh'],
            eps: doc.data()['eps'],
            typeUser: doc.data()['typeUser'],
            academiCareer: doc.data()['academiCareer'],
            idKit: doc.data()['idKit'],
            idRadio: doc.data()['idRadio'],
            idHeadPhones: doc.data()['idHeadPhones'],
          ))
        }).toList(),
        userList(null),
      });
    });

  }

  GestureDetector card(UserModel doc) {
    return GestureDetector(
      onTap: () {
        Global.doc = doc;
        // Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //         builder: (BuildContext context) => DetailsUserPage(
        //           title: "Detalles",
        //         )));
      },
      child: Container(
        height: 124.0,
        margin: EdgeInsets.only(left: 46.0),
        decoration: BoxDecoration(
            color: Colors.indigo,
            borderRadius: BorderRadius.circular(8.0),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.black38,
                blurRadius: 5.0,
                offset: Offset(0.0, 5.0),
              )
            ]),
        child: Padding(
          padding: const EdgeInsets.only(top: 10.0, right: 5.0, left: 30.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 35.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      '${doc.name}',
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      '${doc.lastName}',
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Text(
                        '${doc.movil}',
                        style: TextStyle(
                            fontSize: 25,
                            color: doc.activationStatus == true
                                ? Colors.green
                                : Colors.red,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30.0),
                      child: Icon(
                        Icons.album_outlined,
                        color: doc.activationStatus == true
                            ? Colors.green
                            : Colors.red,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container viewImage(UserModel doc) {
    return Container(
      alignment: FractionalOffset.centerLeft,
      child: Container(
        height: 90.0,
        width: 90.0,
        decoration: BoxDecoration(
            color: Colors.redAccent,
            shape: BoxShape.circle,
            image: DecorationImage(
                image: NetworkImage(doc.image), fit: BoxFit.cover),
            boxShadow: [
              BoxShadow(
                color: Color(0xffA4A4A4),
                offset: Offset(1.0, 5.0),
                blurRadius: 3.0,
              )
            ]),
      ),
    );
  }

  void searchOperation(String searchText) {
    if (_isSearching) {
      userList(searchText);
    }
  }

  void userList(String searchText) {
    if (!mounted) return;
    setState(() {
      if(listUsers != null){
        if(searchText == null || searchText == ""){
          _users = Column(
              children: listUsers.map((user) => buildItem(user)).toList()
          );

        }else{
          var usuario = listUsers.where((item)=> item.name.startsWith(searchText)).toList();
          if(0 < usuario.length){
            _users =  Column(
                children: usuario.map((user) => buildItem(user)).toList()
            );
          }else{
            _users = SizedBox();
          }
        }
      }else{
        _users = SizedBox();
      }
    });

  }

  void _handleSearchStart() {
    setState(() {
      _isSearching = true;
    });
  }

  void _handleSearchEnd() {
    setState(() {
      this.iconSearch = Icon(
        Icons.search,
        color: Colors.white,
      );
      this.appBarTitle = Text(
        "Brigadistas",
        style: TextStyle(color: Colors.white),
      );
      _isSearching = false;
      _controller.clear();
    });
  }
}
