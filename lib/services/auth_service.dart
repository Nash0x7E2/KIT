import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:juxt/screens/home.dart';
import 'package:juxt/screens/login_screen.dart';

class AuthService {
  static final _auth = FirebaseAuth.instance;
  static final _firestore = Firestore.instance;
  //TODO: These don't really need to be static, you can create a single instace of the class and "provide" it's value to the children.
  static void signUpUser(
      BuildContext context, String name, String email, String password) async {
    try {
      AuthResult authResult = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser signedInUser = authResult.user;
      if (signedInUser != null) {
        _firestore.collection('/users').document(signedInUser.uid).setData({
          'name': name,
          'email': email,
          'profileImage': '',
        });
        Navigator.pushReplacementNamed(context,
            Home.id); //In reference to above. This was thronwing an error before
      }
    } catch (e) {
      print(e);
    }
  }

  static void logout(BuildContext context) {
    _auth.signOut();
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => LoginScreen()));
  }

  // static void login(String email, String password) async {
  //   try {
  //     await  _auth.signInWithEmailAndPassword(email: email, password: password);  //TODO: Not sure if this is neccessary since we have the same code in the login screen
  //   } catch (e) {
  //     print(e);
  //   }
  // }

}
