import 'package:hacker_news/src/resources/news_api_provider.dart';
import 'dart:convert';
import 'package:test/test.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';

void main(){
  test("FetchTopIds returns a list of IDs ", () async {
    final newsApi=NewsApiProvider();
    newsApi.client=MockClient((request)async{
      return Response(json.encode([1,2,3,4]),200);
    });
    final ids=await newsApi.fetchTopIds();
    expect(ids, [1,2,3,4]);
  });

  test('FetchItems returns item model', () async {
    final newsApi=NewsApiProvider();
    newsApi.client=MockClient((request)async{
      final jsonMap={'id': 123};
      return Response(json.encode(jsonMap),200);
    });
    final item=await newsApi.fetchIten(999);
    expect(item.id,123);
  });
}