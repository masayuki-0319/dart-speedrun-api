import 'package:http/http.dart' as http;

import '../base_api.dart';
import '../util/get_single_data.dart';
import '../../models/leaderboard.dart';

class LeaderboardCategoryApi extends BaseApi with GetSingleData {
  LeaderboardCategoryApi({this.record_id, this.category_id})
      : assert((record_id == null && category_id == null) || (record_id != null && category_id != null));
  String record_id;
  String category_id;

  @override
  String endpointPath() =>
      '/api/v1/leaderboards/${record_id}/category/${category_id}';

  @override
  Map<String, dynamic> parseJsonData(http.Response response) {
    return getSingleData(response, leaderboardFromJson);
  }
}
