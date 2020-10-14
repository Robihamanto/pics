import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pics/src/models/image_model.dart';

class ImageList extends StatelessWidget {

  List<ImageModel> images;

  ImageList(this.images);

  @override
  Widget build(BuildContext context) {
      return ListView.builder(
        itemCount: images.length,
        itemBuilder: (context, index) {
          //return Text('${images[index].id}: ${images[index].title}');
          return buildImage(images[index]);
        },
      );
  }

  Widget buildImage(ImageModel image) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
      ),
      padding: EdgeInsets.all(20.0),
      margin: EdgeInsets.all(20.0),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 20.0),
            child: Image.network("${image.url}"),
          ),
          Text("${image.title}"),
        ],
      ),
    );
  }

}
