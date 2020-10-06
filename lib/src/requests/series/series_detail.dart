import 'package:http/http.dart' as http;

import '../base_api.dart';
import '../../models/series.dart';
import '../util/get_single_data.dart';

class SeriesDetailApi extends BaseApi with GetSingleData {
  SeriesDetailApi({this.id});
  String id;

  @override
  String endpointPath() => '/api/v1/series/${id}';

  @override
  Map<String, dynamic> parseJsonData(http.Response response) {
    return getSingleData(response, seriesFromJson);
  }
}
