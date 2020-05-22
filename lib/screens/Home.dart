import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:juxt/components/nav_button.dart';
import 'package:juxt/screens/create_post.dart';
import 'package:juxt/screens/feed_screen.dart';
import 'package:juxt/screens/notification_screen.dart';
import 'package:juxt/screens/profile_screen.dart';
import 'package:juxt/screens/search_screen.dart';

class Home extends StatefulWidget {
  static const id = "home";
  const Home({Key key, this.user}) : super(key: key);
  final FirebaseUser user;
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentTab = 0;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }
/// We pass this function as the parameter to the `RadialMenu`. It corresponds to the `onButtonPressed`
/// declared earlier. Notice it takes a parameter of type `int`, this allows us to know which button was pressed.
/// The int represents the index of the button we defined earlier. 
  void onMenuPress(int index) {
    /// Opted to use a switch here since it's a lot simpler and more readable than using nested if-else statements. 
    /// We check the index of the button and trigger an action based on which button was pressed. 
    switch (index) {
      case 0:
        _pageController.animateToPage(
          3,
          duration: kThemeAnimationDuration,
          curve: Curves.decelerate,
        );
        break;
      case 1:
        _pageController.animateToPage(
          5,
          duration: kThemeAnimationDuration,
          curve: Curves.decelerate,
        );
        break;
      case 2:
        _pageController.animateToPage(
          2,
          duration: kThemeAnimationDuration,
          curve: Curves.decelerate,
        );
        break;
      case 3:
        _pageController.animateToPage(
          2,
          duration: kThemeAnimationDuration,
          curve: Curves.decelerate,
        );
        break;
      case 4:
        _pageController.animateToPage(
          1,
          duration: kThemeAnimationDuration,
          curve: Curves.decelerate,
        );
        // Does nothing, unknown index.
        break;
      default:
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      body: PageView(
        controller: _pageController,
        children: <Widget>[
          FeedScreen(),
          SearchScreen(),
          CreatePostScreen(),
          NotificationScreen(),
          ProfileScreen(),
        ],
        onPageChanged: (int index) {
          setState(() {
            currentTab = index;
          });
        },
      ),
      bottomNavigationBar: SizedBox(
        height: 500.0,
        child: RadialMenu(
          // Passing `onMenuPress` as the parameter. 
          onButtonPressed: onMenuPress,
        ),
      ), //box height is resticting the press gestures on buttons
    );
  }
}
