import 'package:http/http.dart' as http;

import '../base_api.dart';
import '../util/get_collection_data.dart';
import '../../models/leaderboard.dart';

class CategoryRecordsApi extends BaseApi with GetCollectionData {
  CategoryRecordsApi({this.id});
  String id;

  @override
  String endpointPath() => '/api/v1/categories/${id}/records';

  @override
  Map<String, dynamic> parseJsonData(http.Response response) {
    return getCollectionData(response, leaderboardFromJson);
  }
}
