import 'dart:convert';
import 'package:http/http.dart' show Client;
import 'package:pics/src/models/item_model.dart';
import 'package:pics/src/resources/repository.dart';

class NewsService implements Source {

  var client = Client();
  var _baseUrl = 'https://hacker-news.firebaseio.com/v0/';

  Future<List<int>> fetchTopNews() async {
    final response = await client.get('$_baseUrl/topstories.json');
    final ids = json.decode(response.body);
    return ids.cast<int>();
  }

  Future<ItemModel> fetchNews(int id) async {
    final response = await client.get('$_baseUrl/item/$id.json');
    final parsedJson = json.decode(response.body);

    final item = ItemModel.fromJson(parsedJson);
    return item;
  }

}

