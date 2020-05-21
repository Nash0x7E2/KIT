import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:juxt/services/auth_service.dart';
import 'package:juxt/screens/login_screen.dart';
import 'package:vector_math/vector_math.dart' show radians;

class Home extends StatefulWidget {
  static final String id = 'home';
  const Home({Key key, this.user}) : super(key: key);
  final FirebaseUser user;
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: FlatButton(
            onPressed: () => AuthService.logout(context),
            child: Text('Logout'),
          ),
        ),
        floatingActionButton: Stack(children: <Widget>[
          (FloatingActionButton(
            onPressed: (null),
            child: Icon(FontAwesomeIcons.plus),
            foregroundColor: Colors.white,
            backgroundColor: Color(0xff30475e),
          )),
          FloatingActionButton(
            onPressed: (null),
            child: Icon(FontAwesomeIcons.plus),
            foregroundColor: Colors.white,
            backgroundColor: Color(0xff30475e),
          ),
        ]),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat);
  }
}
