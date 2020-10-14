import 'package:flutter/material.dart';
import 'package:pics/src/scenes/gallery_scene.dart';
import 'package:pics/src/scenes/login_scene.dart';

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AppState();
  }
}

class AppState extends State<App> {

  @override
  Widget build(BuildContext context) {
//    return GalleryScene();
    return LoginScene();
  }
}
