import 'package:http/http.dart' as http;

import '../base_api.dart';
import '../util/get_collection_data.dart';
import '../../models/level.dart';

class GameLevelsApi extends BaseApi with GetCollectionData {
  GameLevelsApi({this.id});
  String id;

  @override
  String endpointPath() => '/api/v1/games/${id}/levels';

  @override
  Map<String, dynamic> parseJsonData(http.Response response) {
    return getCollectionData(response, levelFromJson);
  }
}
