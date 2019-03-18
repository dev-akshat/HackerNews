import 'dart:async';
import 'news_api_provider.dart';
import 'news_db_provider.dart';
import '../models/item_model.dart';

class Repository {
  NewsDbProvider dbProvider = NewsDbProvider();
  NewsApiProvider apiProvider = NewsApiProvider();

  Future<List<int>> fetchTopIds() => apiProvider.fetchTopIds();

  Future<ItemModel> fetchItem(int id) async {
    var item = await dbProvider.fetchItem(id);
    if (item != null) return item;
    item = await apiProvider.fetchItem(id);
    dbProvider.addItem(item);
    //we can put await keyword to wait for item to get inserted into DataBase before returning it but its unnecessary but we dont care if it finishes successfully or not
    return item;
  }
}
