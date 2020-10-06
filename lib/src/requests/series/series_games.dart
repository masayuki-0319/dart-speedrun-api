import 'dart:developer';

import 'package:http/http.dart' as http;

import '../base_api.dart';
import '../util/get_collection_data.dart';
import '../../models/game.dart';

class SeriesGamesApi extends BaseApi with GetCollectionData  {
  SeriesGamesApi({this.id});
  String id;

  @override
  String endpointPath() => '/api/v1/series/${id}/games';

  @override
  Map<String, dynamic> parseReponse(http.Response response) {
    if (response.statusCode == 200) {
      return getCollectionData(response, gameFromJson);
    } else {
      log('errorStatus: ${response.statusCode}\n  requestUri:${response.request.url}');
      return null;
    }
  }
}
