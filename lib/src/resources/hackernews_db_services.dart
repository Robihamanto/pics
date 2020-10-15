import 'package:path_provider/path_provider.dart';
import 'package:pics/src/models/item_model.dart';
import 'package:pics/src/resources/repository.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io';
import 'package:path/path.dart';

class NewsDBService implements Source, Cache {
  Database db;

  void init() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentDirectory.path, "items.db");
    db = await openDatabase(
        path,
      version: 1,
      onCreate: (db, version) {
        db.execute("""
          CREATE TABLE Items
          (
          id INTEGER PRIMARY KEY,
          type TEXT,
          by TEXT,
          time INTEGER,
          text TEXT,
          dead INTEGER,
          parent INTEGER,
          kids BLOB,
          url TEXT,
          score INTEGER,
          title TEXT,
          descendants INTEGER
          )        
        """);
      },
    );
  }

  Future<ItemModel> fetchNews(int id) async {
    final maps = await db.query(
      "Items",
      columns: null,
      where: "id = ? ",
      whereArgs: [id],
    );

    if (maps.length < 1) {
      return null;
    }

    return ItemModel.fromDB(maps.first);
  }

  Future<int> addItem(ItemModel item) {
    return db.insert("Items", item.toMap(item));
  }

  Future<List<int>> fetchTopNews() {
    return null;
  }

}

final newsDBService = NewsDBService();