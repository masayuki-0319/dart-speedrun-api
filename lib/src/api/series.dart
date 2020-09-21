import 'dart:convert';

import '../models/game.dart';
import '../models/series.dart';
import 'base.dart';

String _seriesListPath() => '/api/v1/series';
String _seriesDetailPath(String id) => '/api/v1/series/$id';
String _seriesGamesPath(String id) => '/api/v1/series/$id/games';

class SeriesApi extends BaseApi {
  Future<List<Series>> requestList([Map<String, dynamic> options]) async {
    final response = await getRequest(_seriesListPath(), options);
    final jsonData = json.decode(response.body);

    if (response.statusCode == 200 && jsonData['data'].length != 0) {
      final mainData = jsonData['data'].cast<Map<String, dynamic>>()
          as List<Map<String, dynamic>>;

      return mainData.map((json) => seriesFromJson(json)).toList();
    } else {
      return null;
    }
  }

  Future<Series> requestDetail(String id,
      [Map<String, dynamic> options]) async {
    final response = await getRequest(_seriesDetailPath(id), options);
    final jsonData = json.decode(response.body);

    if (response.statusCode == 200) {
      final mainData = jsonData['data'];

      return seriesFromJson(mainData);
    } else {
      return null;
    }
  }

  Future<List<Game>> requestGames(String id,
      [Map<String, dynamic> options]) async {
    final response = await getRequest(_seriesGamesPath(id), options);
    final jsonData = json.decode(response.body);

    if (response.statusCode == 200 && jsonData['data'].length != 0) {
      final mainData = jsonData['data'].cast<Map<String, dynamic>>()
          as List<Map<String, dynamic>>;

      return mainData.map((json) => gameFromJson(json)).toList();
    } else {
      return null;
    }
  }
}
