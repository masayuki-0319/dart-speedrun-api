import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

import '../../models/game.dart';
import '../../models/pagination.dart';
import '../base_api.dart';

class GameListApi extends BaseApi {
  @override
  String endpointPath() => '/api/v1/games';

  @override
  Map<String, dynamic> parseReponse(http.Response response) {
    if (response.statusCode == 200) {
      final jsonMap = json.decode(response.body) as Map<String, dynamic>;
      final result = {
        'data': jsonMap['data'].map((json) => gameFromJson(json)).toList(),
        'pagination': paginationFromJson(jsonMap['pagination']),
      };

      return result;
    } else {
      log('errorStatus: ${response.statusCode}\n  requestUri:${response.request.url}');
      return null;
    }
  }
}
