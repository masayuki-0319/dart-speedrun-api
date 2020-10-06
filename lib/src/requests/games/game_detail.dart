import 'package:http/http.dart' as http;

import '../base_api.dart';
import '../util/get_single_data.dart';
import '../../models/game.dart';

class GameDetailApi extends BaseApi with GetSingleData {
  GameDetailApi({this.id});
  String id;

  @override
  String endpointPath() => '/api/v1/games/${id}';

  @override
  Map<String, dynamic> parseJsonData(http.Response response) {
    return getSingleData(response, gameFromJson);
  }
}
