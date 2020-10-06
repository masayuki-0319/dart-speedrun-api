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
  Map<String, dynamic> parseJsonData(http.Response response) {
    return getCollectionData(response, gameFromJson);
  }
}
