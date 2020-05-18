import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  static final String id = 'signup_screen';

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  String _name, _email, _password;

  _submit() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      print(_name);
      print(_email);
      print(_password);
      //logging in user w/ Firebase
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'KIT',
              style: TextStyle(
                fontSize: 50.0,
              ),
            ),
            Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 30.0, vertical: 8.0),
                    child: TextFormField(
                      decoration: InputDecoration(labelText: 'name'),
                      validator: (input) => input.trim().isEmpty
                          ? 'Please enter a valid name'
                          : null,
                      onSaved: (input) => _name = input,
                      obscureText: true,
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 30.0, vertical: 8.0),
                    child: TextFormField(
                      decoration: InputDecoration(labelText: 'email'),
                      validator: (input) => !input.contains('@')
                          ? 'Please enter a valid email'
                          : null,
                      onSaved: (input) => _email = input,
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 30.0, vertical: 8.0),
                    child: TextFormField(
                      decoration: InputDecoration(labelText: 'password'),
                      validator: (input) => input.length < 6
                          ? 'Must be at least 6 characters'
                          : null,
                      onSaved: (input) => _password = input,
                      obscureText: true,
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Container(
                    width: 250.0,
                    child: RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        onPressed: _submit,
                        color: Color(0xff30475e),
                        padding: EdgeInsets.all(15.0),
                        child: Text(
                          'Sign Up',
                          style: TextStyle(color: Colors.white, fontSize: 18.0),
                        )),
                  ),
                  SizedBox(height: 20.0),
                  Container(
                    width: 250.0,
                    child: RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        onPressed: () => Navigator.pop(context),
                        color: Color(0xff30475e),
                        padding: EdgeInsets.all(15.0),
                        child: Text(
                          'Back to Login',
                          style: TextStyle(color: Colors.white, fontSize: 18.0),
                        )),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}