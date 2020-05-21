import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:juxt/screens/home.dart';
import 'package:juxt/screens/login_screen.dart';
import 'package:juxt/screens/signup_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget _getScreenID() {
    return StreamBuilder<FirebaseUser>(
        stream: FirebaseAuth.instance.onAuthStateChanged,
        builder: (BuildContext contex, snapShot) {
          if (snapShot.hasData) {
            return Home();
          } else {
            return LoginScreen();
          }
        });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'KIT',
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xff30475e),
        accentColor: Color(0xfff2a365),
        scaffoldBackgroundColor: Color(0xff222831),
      ),
      debugShowCheckedModeBanner: false,
      home: _getScreenID(),
      routes: {
        LoginScreen.id: (context) => LoginScreen(),
        SignupScreen.id: (context) => SignupScreen(),
        Home.id: (context) => Home(),
      },
    );
  }
}
