import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' show get;
import 'package:pics/src/models/image_model.dart';
import 'package:pics/src/widgets/image_list.dart';

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AppState();
  }
}

class AppState extends State<App> {

  var counter = 1;
  List<ImageModel> images = [];

  Future<void> fetchImages() async {

    var url = "https://jsonplaceholder.typicode.com/photos/${counter++}";
    var response = await get(url);
    var image = ImageModel.fromjson(json.decode(response.body));

    setState(() {
      images.add(image);
    });

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Let\'s see image'),
        ),
        body: new Center(
          child: ImageList(images),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: fetchImages,
        ),
      ),
    );
  }
}
