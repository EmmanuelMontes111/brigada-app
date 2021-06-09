import 'package:brigadapoli/src/bloc/login_bloc.dart';
import 'package:brigadapoli/src/bloc/provider.dart';
import 'package:brigadapoli/src/providers/user_provider.dart';
import 'package:brigadapoli/src/ui/widgets/dropwnbutton_widget.dart';
import 'package:brigadapoli/src/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final userProvider = new UserProvider();

  int selectedIndexRH = -1;

  List<String> listRH = [
    'O-',
    'O+',
    'A-',
    'A+',
    'B-',
    'B+',
    'AB-',
    'AB+',
  ];

  @override
  Widget build(BuildContext context) {

    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
        body: Stack(
      children: <Widget>[
        _createBackground(context, screenSize),
        _registerForm(context, screenSize),
      ],
    ));
  }

  Widget _registerForm(BuildContext context, final screenSize) {
    final bloc = Provider.of(context);

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SafeArea(
              child: Container(
            height: 180.0,
          )),
          Container(
            width: screenSize.width * 0.85,
            margin: EdgeInsets.symmetric(vertical: 40.0),
            padding: EdgeInsets.symmetric(vertical: 50.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5.0),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 3.0,
                  offset: Offset(0.0, 5.0),
                  spreadRadius: 3.0,
                ),
              ],
            ),
            child: Column(
              children: <Widget>[
                Text(
                  "Crear Cuenta",
                  style: TextStyle(fontSize: 20.0),
                ),
                SizedBox(height: 10.0),
                _createName(bloc),
                SizedBox(height: 10.0),
                _createLastName(bloc),
                SizedBox(height: 10.0),
                _createId(bloc),
                SizedBox(height: 10.0),
                _createRH(bloc),
                SizedBox(height: 10.0),
                _createEPS(bloc),
                SizedBox(height: 10.0),
                _createAcademiCareer(bloc),
                SizedBox(height: 10.0),
                _createEmail(bloc),
                SizedBox(height: 10.0),
                _createPassword(bloc),
                SizedBox(height: 30.0),
                _createBotonRegister(bloc),
                SizedBox(
                  height: 20.0,
                ),
              ],
            ),
          ),
          TextButton(
            child: Text('¿Ya tienes cuenta? Login'),
            onPressed: () => Navigator.pushNamed(context, 'login'),
          ),
          SizedBox(
            height: 100.0,
          )
        ],
      ),
    );
  }

  Widget _createName(LoginBloc bloc) {
    return StreamBuilder(
        stream: bloc.emailStream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return Container(
            padding: EdgeInsets.symmetric(
              horizontal: 20.0,
            ),
            child: TextField(
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                icon: Icon(
                  Icons.drive_file_rename_outline,
                  color: Colors.indigo,
                ),
                labelText: 'Nombre',
                counterText: snapshot.data,
                errorText: snapshot.error,
              ),
              onChanged: (value) => bloc.changedEmail(value),
            ),
          );
        });
  }

  Widget _createLastName(LoginBloc bloc) {
    return StreamBuilder(
        stream: bloc.emailStream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return Container(
            padding: EdgeInsets.symmetric(
              horizontal: 20.0,
            ),
            child: TextField(
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                icon: Icon(
                  Icons.drive_file_rename_outline,
                  color: Colors.indigo,
                ),
                labelText: 'Apellidos',
                counterText: snapshot.data,
                errorText: snapshot.error,
              ),
              onChanged: (value) => bloc.changedEmail(value),
            ),
          );
        });
  }

  Widget _createId(LoginBloc bloc) {
    return StreamBuilder(
        stream: bloc.emailStream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return Container(
            padding: EdgeInsets.symmetric(
              horizontal: 20.0,
            ),
            child: TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                icon: Icon(
                  Icons.perm_identity,
                  color: Colors.indigo,
                ),
                labelText: 'Documento',
                counterText: snapshot.data,
                errorText: snapshot.error,
              ),
              onChanged: (value) => bloc.changedEmail(value),
            ),
          );
        });
  }

  Widget _createRH(LoginBloc bloc) {
    return StreamBuilder(
        stream: bloc.emailStream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return Container(
            padding: EdgeInsets.symmetric(
              horizontal: 20.0,
            ),
            child: DropdownbuttonWidget(
              hint: "Ingese el RH",
              title: "RH",
              items: listRH,
              selectedIndex: selectedIndexRH,
              onChanged: (position) {
                setState(() {
                  selectedIndexRH = position;
                });
              },
            ),
          );
        });
  }


  Widget _createEPS(LoginBloc bloc) {
    return StreamBuilder(
        stream: bloc.emailStream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return Container(
            padding: EdgeInsets.symmetric(
              horizontal: 20.0,
            ),
            child: TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                icon: Icon(
                  Icons.add_business_sharp,
                  color: Colors.indigo,
                ),
                labelText: 'EPS',
                counterText: snapshot.data,
                errorText: snapshot.error,
              ),
              onChanged: (value) => bloc.changedEmail(value),
            ),
          );
        });
  }

  Widget _createAcademiCareer(LoginBloc bloc) {
    return StreamBuilder(
        stream: bloc.emailStream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return Container(
            padding: EdgeInsets.symmetric(
              horizontal: 20.0,
            ),
            child: TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                icon: Icon(
                  Icons.star,
                  color: Colors.indigo,
                ),
                labelText: 'Carrera',
                counterText: snapshot.data,
                errorText: snapshot.error,
              ),
              onChanged: (value) => bloc.changedEmail(value),
            ),
          );
        });
  }

  Widget _createEmail(LoginBloc bloc) {
    return StreamBuilder(
        stream: bloc.emailStream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return Container(
            padding: EdgeInsets.symmetric(
              horizontal: 20.0,
            ),
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                icon: Icon(
                  Icons.alternate_email,
                  color: Colors.indigo,
                ),
                labelText: 'Correo electrónico',
                hintText: 'ejemplo@correo.com',
                counterText: snapshot.data,
                errorText: snapshot.error,
              ),
              onChanged: (value) => bloc.changedEmail(value),
            ),
          );
        });
  }

  Widget _createPassword(LoginBloc bloc) {
    return StreamBuilder(
        stream: bloc.passwordStream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return Container(
            padding: EdgeInsets.symmetric(
              horizontal: 20.0,
            ),
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                  icon: Icon(
                    Icons.lock_outline,
                    color: Colors.indigo,
                  ),
                  labelText: 'Contraseña',
                  counterText: snapshot.data,
                  errorText: snapshot.error),
              onChanged: (value) => bloc.changedPassword(value),
            ),
          );
        });
  }

  Widget _createBotonRegister(LoginBloc bloc) {
    //formValidStream

    return StreamBuilder(
        stream: bloc.formValidStream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return ElevatedButton(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
              child: Text('Registrar'),
            ),
            style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              )),
              backgroundColor: snapshot.hasData
                  ? MaterialStateProperty.all(Color.fromRGBO(4, 75, 172, 1.0))
                  : MaterialStateProperty.all(Colors.black12),
              elevation: MaterialStateProperty.all(0.0),
            ),
            onPressed: snapshot.hasData ? () => _register(bloc, context) : null,
          );
        });
  }

  _register(LoginBloc bloc, BuildContext context) async {
    final info = await userProvider.newUser(bloc.email, bloc.password);

    if (info['ok']) {
      Navigator.pushReplacementNamed(context, 'viewPages');
    } else {
      viewAlert(context, "Email existente");
    }
  }

  Widget _createBackground(BuildContext context, final screenSize) {
    final blueBackground = Container(
      height: screenSize.height * 0.4,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: <Color>[
          Color.fromRGBO(4, 75, 172, 1.0),
          Color.fromRGBO(31, 82, 194, 1.0)
        ]),
      ),
    );

    final circle = Container(
      width: 100.0,
      height: 100.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.0),
        color: Color.fromRGBO(255, 255, 255, 0.05),
      ),
    );

    final logoImage = Container(
      child: Container(
        height: 170.0,
        width: 170.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: AssetImage('assets/img/medium_logo.png'),
          ),
        ),
      ),
    );
    return Stack(
      children: <Widget>[
        blueBackground,
        Positioned(top: 90.0, left: 30.0, child: circle),
        Positioned(top: -40.0, right: -30.0, child: circle),
        Positioned(top: 90.0, left: 30.0, child: circle),
        Positioned(bottom: -50.0, right: -10.0, child: circle),
        Positioned(bottom: 120.0, right: 20.0, child: circle),
        Positioned(bottom: -50.0, left: -20.0, child: circle),
        Container(
          padding: EdgeInsets.only(top: 20.0),
          child: Column(
            children: <Widget>[
              logoImage,
              SizedBox(
                height: 5.0,
                width: double.infinity,
              ),
              Text(
                'BrigadaApp',
                style: TextStyle(color: Colors.white, fontSize: 25.0),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
