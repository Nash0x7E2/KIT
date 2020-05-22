import 'package:flutter/material.dart';
import 'dart:math';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vector_math/vector_math.dart' show radians;

/// I added a call back function that can pass to handle tap events. I am using a `ValueChanged` here and typing it as `int` meaning
/// we can pass the index of the button tapped allowing us to look it up and handle the gesture elsewhere. It's a similar approach to the
/// built-in button navigation bar.
class RadialMenu extends StatefulWidget {
  final ValueChanged<int> onButtonPressed;

  const RadialMenu({Key key, @required this.onButtonPressed}) : super(key: key);
  createState() => _RadialMenuState();
}

class _RadialMenuState extends State<RadialMenu>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> rotation;
  Animation<double> translation;
  Animation<double> scale;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: Duration(milliseconds: 200),
      vsync: this,
    );
    translation = Tween<double>(
      begin: 0.0,
      end: 120.0,
    ).animate(
      CurvedAnimation(parent: controller, curve: Curves.easeOutCirc),
    );
    scale = Tween<double>(
      begin: 1.3,
      end: 0.0,
    ).animate(
      CurvedAnimation(parent: controller, curve: Curves.easeInOutCirc),
    );
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
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  _open() => controller.forward();

  _close() => controller.reverse();

  void _handlePress(int index) {
    /// When the button is pressed, we trigger the function with the index of the pressed button
    /// then close the animation.
    widget.onButtonPressed(index);
    _close();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, widget) {
        return Transform.rotate(
          angle: radians(rotation.value),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 70.0),
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: <Widget>[
                RadialButton(
                  angle: 0,
                  translation: translation.value,
                  icon: FontAwesomeIcons.solidBell,
                  // Notice we are passing the index of the button here.
                  // We could even move these buttons to a list and map/iterate over them but I did not want to
                  // complicate things...feel free to experiment!
                  onButtonPressed: () => _handlePress(0),
                ),
                RadialButton(
                  angle: 225,
                  translation: translation.value,
                  color: Color(0xff30475e),
                  icon: FontAwesomeIcons.userAlt,
                  onButtonPressed: () => _handlePress(1),
                ),
                RadialButton(
                  angle: 270,
                  translation: translation.value,
                  color: Color(0xff30475e),
                  icon: FontAwesomeIcons.plus,
                  onButtonPressed: () => _handlePress(2),
                ),
                RadialButton(
                  angle: 180,
                  translation: translation.value,
                  icon: FontAwesomeIcons.solidEnvelope,
                  onButtonPressed: () => _handlePress(3),
                ),
                RadialButton(
                  angle: 315,
                  translation: translation.value,
                  icon: FontAwesomeIcons.search,
                  onButtonPressed: () => _handlePress(4),
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
              ],
            ),
          ),
        );
      },
    );
  }
}

// Since all buttons share similar properties, we can extract the defination to a widget then expose the
// properties we want to change in the constructor.
// Lastly, I am using a stateless widget here since there is no state for these buttons, it's just static UI.
class RadialButton extends StatelessWidget {
  const RadialButton({
    Key key,
    @required this.onButtonPressed,
    @required this.translation,
    @required this.icon,
    @required this.angle,
    this.color = const Color(0xff30475e),
  }) : super(key: key);
  final VoidCallback onButtonPressed;
  final double translation;
  final IconData icon;
  final Color color;
  final double angle;
  @override
  Widget build(BuildContext context) {
    final double rad = radians(angle);
    return Transform(
      transform: Matrix4.identity()
        ..translate(
          (translation) * cos(rad),
          (translation) * sin(rad),
        ),
      child: FloatingActionButton(
        child: Icon(icon),
        backgroundColor: color,
        foregroundColor: Colors.white,
        onPressed: onButtonPressed,
        elevation: 2.5,
      ),
    );
  }
}
