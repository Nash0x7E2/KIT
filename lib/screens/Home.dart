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
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Container(
          height: 65.0,
          width: 65.0,
          child: RadialMenu(),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class RadialMenu extends StatefulWidget {
  createState() => _RadialMenuState();
}

class _RadialMenuState extends State<RadialMenu>
    with SingleTickerProviderStateMixin {
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: Duration(milliseconds: 900), vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return RadialAnimation(controller: controller);
  }
}

class RadialAnimation extends StatelessWidget {
  final AnimationController controller;
  RadialAnimation({Key key, this.controller})
      : scale = Tween<double>(
          begin: 1.5,
          end: 0.0,
        ).animate(
          CurvedAnimation(parent: controller, curve: Curves.fastOutSlowIn),
        ),
        super(key: key);

  final AnimationController animationController;
  final Animation<double> scale;

  build(context) {
    return AnimatedBuilder(
        animation: controller,
        builder: (context, builder) {
          return Stack(
            children: <Widget>[
              Transform.scale(
                scale: scale.value - 1,
                child: FloatingActionButton(
                  child: Icon(
                    FontAwesomeIcons.times,
                    color: Colors.white,
                  ),
                  onPressed: _close,
                  backgroundColor: Color(0xff30475e),
                ),
              ),
              Transform.scale(
                scale: scale.value,
                child: FloatingActionButton(
                  child: Icon(
                    FontAwesomeIcons.plus,
                    color: Colors.white,
                  ),
                  onPressed: _close,
                  backgroundColor: Color(0xff30475e),
                ),
              ),
            ],
          );
        });
  }

  _open() {
    controller.forward();
  }

  _close() {
    controller.reverse();
  }
}
