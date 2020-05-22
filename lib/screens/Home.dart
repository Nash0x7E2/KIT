import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:juxt/components/nav_button.dart';
import 'package:juxt/screens/create_post.dart';
import 'package:juxt/screens/feed_screen.dart';
import 'package:juxt/screens/profile_screen.dart';
import 'package:juxt/screens/search_screen.dart';
import 'package:juxt/screens/notification_screen.dart';
import 'dart:math';
import 'package:vector_math/vector_math.dart' show radians, Vector3;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Home extends StatefulWidget {
  static final String id = 'home';
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
          child:
              RadialMenu()), //box height is resticting the press gestures on buttons
    );
  }
}

// Container(
//   child: FlatButton(
//     onPressed: () => AuthService.logout(context),
//     child: Text('Logout'),
//   ),
// ),
// Column(
//   crossAxisAlignment: CrossAxisAlignment.center,
//   mainAxisAlignment: MainAxisAlignment.end,
//   children: <Widget>[
//     Container(alignment: Alignment.bottomCenter, child: RadialMenu()),
//   ],
// ),
