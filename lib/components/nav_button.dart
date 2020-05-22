import 'package:flutter/material.dart';
import 'dart:math';
import 'package:vector_math/vector_math.dart' show radians, Vector3;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:juxt/screens/home.dart';

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
        AnimationController(duration: Duration(milliseconds: 200), vsync: this);
    // ..addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return RadialAnimation(controller: controller);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class RadialAnimation extends StatelessWidget {
  RadialAnimation({Key key, this.controller})
      : translation = Tween<double>(
          begin: 0.0,
          end: 120.0,
        ).animate(
          CurvedAnimation(parent: controller, curve: Curves.easeOutCirc),
        ),
        scale = Tween<double>(
          begin: 1.3,
          end: 0.0,
        ).animate(
          CurvedAnimation(parent: controller, curve: Curves.easeInOutCirc),
        ),
        rotation = Tween<double>(
          begin: 0.0,
          end: 0.0,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(
              0.0,
              0.0,
              curve: Curves.decelerate,
            ),
          ),
        ),
        super(key: key);

  final AnimationController controller;
  final Animation<double> rotation;
  final Animation<double> translation;
  final Animation<double> scale;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: controller,
        builder: (context, widget) {
          return Transform.rotate(
              angle: radians(rotation.value),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 70.0),
                child:
                    Stack(alignment: Alignment.bottomCenter, children: <Widget>[
                  _buildButtonNotification(0,
                      color: Color(0xff30475e),
                      icon: FontAwesomeIcons.solidBell),
                  _buildButtonProfile(225,
                      color: Color(0xff30475e), icon: FontAwesomeIcons.userAlt),
                  _buildButtonUpload(270,
                      color: Color(0xff30475e), icon: FontAwesomeIcons.plus),
                  _buildButtonSearch(315,
                      color: Color(0xff30475e), icon: FontAwesomeIcons.search),
                  _buildButtonMessages(
                    180,
                    color: Color(0xff30475e),
                    icon: FontAwesomeIcons.solidEnvelope,
                  ),
                  Transform.scale(
                    scale: scale.value - 1,
                    child: FloatingActionButton(
                      elevation: 2.5,
                      backgroundColor: Color(0xff30475e),
                      foregroundColor: Colors.white,
                      // child: Icon(FontAwesomeIcons.times),
                      onPressed: _close,
                    ),
                  ),
                  Transform.scale(
                    scale: scale.value,
                    child: FloatingActionButton(
                      elevation: 2.5,
                      backgroundColor: Color(0xff30475e),
                      foregroundColor: Colors.white,
                      child: Icon(FontAwesomeIcons.poo),
                      onPressed: _open,
                    ),
                  )
                ]),
              ));
        });
  }

  _open() {
    controller.forward();
  }

  _close() {
    controller.reverse();
  }

  _buildButtonNotification(double angle, {Color color, IconData icon}) {
    final double rad = radians(angle);
    return Transform(
        transform: Matrix4.identity()
          ..translate(
              (translation.value) * cos(rad), (translation.value) * sin(rad)),
        child: FloatingActionButton(
            child: Icon(icon),
            backgroundColor: color,
            foregroundColor: Colors.white,
            onPressed: _close,
            elevation: 2.5));
  }

  _buildButtonProfile(double angle, {Color color, IconData icon}) {
    final double rad = radians(angle);
    return Transform(
        transform: Matrix4.identity()
          ..translate(
              (translation.value) * cos(rad), (translation.value) * sin(rad)),
        child: FloatingActionButton(
            child: Icon(icon),
            backgroundColor: color,
            foregroundColor: Colors.white,
            onPressed: _close,
            elevation: 2.5));
  }

  _buildButtonUpload(double angle, {Color color, IconData icon}) {
    final double rad = radians(angle);
    return Transform(
        transform: Matrix4.identity()
          ..translate(
              (translation.value) * cos(rad), (translation.value) * sin(rad)),
        child: FloatingActionButton(
            child: Icon(icon),
            backgroundColor: color,
            foregroundColor: Colors.white,
            onPressed: _close,
            elevation: 2.5));
  }

  _buildButtonSearch(double angle, {Color color, IconData icon}) {
    final double rad = radians(angle);
    return Transform(
        transform: Matrix4.identity()
          ..translate(
              (translation.value) * cos(rad), (translation.value) * sin(rad)),
        child: FloatingActionButton(
            child: Icon(icon),
            backgroundColor: color,
            foregroundColor: Colors.white,
            onPressed: _close,
            elevation: 2.5));
  }

  _buildButtonMessages(double angle, {Color color, IconData icon}) {
    final double rad = radians(angle);
    return Transform(
        transform: Matrix4.identity()
          ..translate(
              (translation.value) * cos(rad), (translation.value) * sin(rad)),
        child: FloatingActionButton(
            child: Icon(icon),
            backgroundColor: color,
            foregroundColor: Colors.white,
            onPressed: _close,
            elevation: 2.5));
  }
}
