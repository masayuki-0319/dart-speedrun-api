import 'package:http/http.dart' as http;

import '../base_api.dart';
import '../util/get_collection_data.dart';
import '../../models/variable.dart';

class GameVariablesApi extends BaseApi with GetCollectionData {
  GameVariablesApi({this.id});
  String id;

  @override
  String endpointPath() => '/api/v1/games/${id}/variables';

  @override
  Map<String, dynamic> parseJsonData(http.Response response) {
    return getCollectionData(response, variableFromJson);
  }
}
