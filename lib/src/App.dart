import 'package:flutter/material.dart';
import 'package:pics/src/blocs/Provider.dart';
import 'package:pics/src/screens/login_screen.dart';

class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Provider(
      child: MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text('Do Login'),
            ),
            body: LoginScreen(),
        ),
      ),
    );
  }
}
