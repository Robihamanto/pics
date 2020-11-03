
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pics/src/blocs/stories/stories_bloc.dart';
import 'package:pics/src/blocs/stories/stories_provider.dart';

class NewsList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final bloc = StoriesProvider.of(context);

    /// Change this
    bloc.fetchTopNews();


    return Scaffold(
      appBar: AppBar(
        title: Text('Top News'),
      ),
      body: buildList(bloc),
    );
  }

  Widget buildList(StoriesBloc bloc) {
    return StreamBuilder(
        stream: bloc.topNewsIDs,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CupertinoActivityIndicator(),
            );
          }

          return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return Text("${snapshot.data[index]}");
              },
          );
        },
    );
  }

  getFuture() {
    return Future.delayed(
      Duration(seconds: 2),
      () => "Hello",
    );
  }

}