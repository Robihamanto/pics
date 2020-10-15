import 'package:pics/src/models/item_model.dart';
import 'package:pics/src/resources/hackernews_db_services.dart';
import 'package:pics/src/resources/hackernews_services.dart';

class Repository {

  NewsService apiService = NewsService();
  NewsDBService dbService = NewsDBService();

  Future<List<int>> fetchTopNews() {
    return apiService.fetchTopNews();
  }

  Future<ItemModel> fetchNews(int id) async {

    var item = await dbService.fetchNews(id);
    if (item != null) {
      return item;
    }

    item = await dbService.fetchNews(id);
    dbService.addItem(item);

    return item;
  }

}