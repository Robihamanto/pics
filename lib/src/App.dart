import 'package:flutter/material.dart';
import 'package:pics/src/screens/login_screen.dart';

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AppState();
  }
}

class AppState extends State<App> {

  @override
  Widget build(BuildContext context) {
//    return GalleryScreen();
    return LoginScreen();
  }
}
