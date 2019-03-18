import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:path/path.dart';
import 'dart:async';
import '../models/item_model.dart';

class NewsDbProvider {
  Database db;

  init() async {
    Directory documentsDirectory =
        await getApplicationDocumentsDirectory(); //package path_provider returns a directory to store files
    final path = join(documentsDirectory.path, "items.db");
    db = await openDatabase(path, version: 1,
        onCreate: (Database newDb, int version) {
      newDb.execute("""
          CREATE TABLE items 
            (
              id INTEGER PRIMARY KEY,
              type TEXT,
              by TEXT,
              time INTEGER,
              text TEXT,
              parent INTEGER,
              kids BLOB,
              dead INTEGER,
              deleted INTEGER,
              url INTEGER,
              title TEXT,
              descendants INTEGER
            )
        """);
    });
  }

  fetchItem(int id) async {
    final maps = await db.query(
      "items",
      columns: null,
      where: "id=?",
      whereArgs: [id],
    );
    if (maps.length > 0) return ItemModel.fromDb(maps.first);
    return null;
  }

  addItem(ItemModel item){
    return db.insert("items", item.toMapForDb());
  }
}
