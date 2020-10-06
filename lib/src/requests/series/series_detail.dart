import 'dart:developer';

import '../base_api.dart';
import '../../models/series.dart';
import '../util/get_single_data.dart';

import 'package:http/http.dart' as http;

class SeriesDetailApi extends BaseApi with GetSingleData {
  SeriesDetailApi({this.id});
  String id;

  @override
  String endpointPath() => '/api/v1/series/${id}';

  @override
  Map<String, dynamic> parseReponse(http.Response response) {
    if (response.statusCode == 200) {
      return getSingleData(response, seriesFromJson);
    } else {
      log('errorStatus: ${response.statusCode}\n  requestUri:${response.request.url}');
      return null;
    }
  }
}
