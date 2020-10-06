import 'dart:developer';

import '../base_api.dart';
import '../util/get_single_data.dart';
import '../../models/game.dart';

import 'package:http/http.dart' as http;

class GameDetailApi extends BaseApi with GetSingleData {
  GameDetailApi({this.id});
  String id;

  @override
  String endpointPath() => '/api/v1/games/${id}';

  @override
  Map<String, dynamic> parseReponse(http.Response response) {
    if (response.statusCode == 200) {
      return getSingleData(response, gameFromJson);
    } else {
      log('errorStatus: ${response.statusCode}\n  requestUri:${response.request.url}');
      return null;
    }
  }
}
