import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pics/src/blocs/stories/stories_provider.dart';
import 'package:pics/src/models/item_model.dart';

class NewsItem extends StatelessWidget {

  final int itemID;

  NewsItem({this.itemID});

  Widget build(BuildContext context) {
    final bloc = StoriesProvider.of(context);

    return StreamBuilder(
      stream: bloc.items,
      builder: (context, AsyncSnapshot<Map<int, Future<ItemModel>>> snapshot) {
        if (!snapshot.hasData) {
          return Text("Stream still loading :");
        }

      return FutureBuilder(
        future: snapshot.data[itemID],
        builder: (context, AsyncSnapshot<ItemModel> itemSnapshot) {
          if (!itemSnapshot.hasData) {
            return Text("Fetching the item..");
          }

          return Text(itemSnapshot.data.title);
      },);
    },);
  }


}