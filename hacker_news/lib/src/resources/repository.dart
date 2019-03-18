import 'dart:async';
import 'news_api_provider.dart';
import 'news_db_provider.dart';
import '../models/item_model.dart';

class Repository {
  NewsDbProvider dbProvider = NewsDbProvider();
  NewsApiProvider apiProvider = NewsApiProvider();

  fetchTopIds() {
    return apiProvider.fetchTopIds();
  }

  fetchItem(int id) async {
    var item = await dbProvider.fetchItem(id);
    if (item != null) return item;
    item = await apiProvider.fetchIten(id);
    dbProvider.addItem(
        item); //we can put await keyword to wait for item to get inserted into DataBase before returning it but its unnecessary but we dont care if it finishes successfully or not
    return item;
  }
}
