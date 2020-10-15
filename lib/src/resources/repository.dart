import 'package:pics/src/models/item_model.dart';
import 'package:pics/src/resources/hackernews_db_services.dart';
import 'package:pics/src/resources/hackernews_services.dart';

class Repository {

  List<Source> sources = [
    newsDBService,
    NewsService(),
  ];

  List<Cache> caches = [
    NewsDBService(),
  ];

  Future<List<int>> fetchTopNews() {
    return sources[1].fetchTopNews();
  }

  Future<ItemModel> fetchNews(int id) async {
    ItemModel item;

    for (final source in sources) {
      item = await source.fetchNews(id);
      if (item != null) {
        for (final cache in caches) {
          cache.addItem(item);
        }
          break;
      }
    }

    return item;
  }

}

abstract class Source {

  Future<List<int>> fetchTopNews();
  Future<ItemModel> fetchNews(int id);

}

abstract class Cache {

  Future<int> addItem(ItemModel item);

}