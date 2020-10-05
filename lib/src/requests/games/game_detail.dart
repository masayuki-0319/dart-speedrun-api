import 'dart:developer';

import '../base_api.dart';
import '../../models/game.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class GameDetailApi extends BaseApi {
  GameDetailApi({this.id});
  String id;

  @override
  String endpointPath() => '/api/v1/games/${id}';

  @override
  Map<String, dynamic> parseReponse(http.Response response) {
    if (response.statusCode == 200) {
      final jsonMap = json.decode(response.body) as Map<String, dynamic>;
      final result = {
        'data': gameFromJson(jsonMap['data']),
      };

      return result;
    } else {
      log('errorStatus: ${response.statusCode}\n  requestUri:${response.request.url}');
      return null;
    }
  }
}
