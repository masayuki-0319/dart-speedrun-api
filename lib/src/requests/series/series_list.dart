import 'package:http/http.dart' as http;

import '../base_api.dart';
import '../util/get_collection_data.dart';
import '../../models/series.dart';

class SeriesListApi extends BaseApi with GetCollectionData  {
  @override
  String endpointPath() => '/api/v1/series';

  @override
  Map<String, dynamic> parseJsonData(http.Response response) {
    return getCollectionData(response, seriesFromJson);
  }
}
