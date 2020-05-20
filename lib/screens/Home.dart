import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Home extends StatefulWidget {
  const Home({Key key, this.user}) : super(key: key);
  final FirebaseUser user;
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Content will go here!')),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Container(
          height: 65.0,
          width: 65.0,
          child: FloatingActionButton(
            //Action to add content
            onPressed: null,
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
            backgroundColor: Color(0xff30475e),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
