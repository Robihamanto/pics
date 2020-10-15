import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:pics/src/resources/hackernews_services.dart';

void main() {

  test("Fetch popular news", () async {
    final service = NewsService();
    service.client = MockClient((request) async {
      return Response(json.encode([1,2,3,4]), 200);
    });

    final newsIDs = await service.fetchTopNews();
    expect(newsIDs, [1,2,3,4]);
  });

  test("Fetch single news", () async {
    final service = NewsService();
    service.client = MockClient((request) async {
      final jsonMap = {'id': 123};
      return Response(json.encode(jsonMap), 200);
    });

    final news = await service.fetchNews(123);
    expect(news.id, 123);
  });

}