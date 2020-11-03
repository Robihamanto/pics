import 'package:flutter/material.dart';
import 'package:pics/src/blocs/stories/stories_provider.dart';
import 'package:pics/src/screens/news_screen.dart';

class App extends StatelessWidget {

  Widget build(BuildContext context) {
    return StoriesProvider(
      child: MaterialApp(
        title: "News!",
        home: NewsList(),
      )
      ,);
  }

}
