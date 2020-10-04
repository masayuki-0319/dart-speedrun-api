import 'dart:developer';

import '../base_api.dart';
import '../../models/series.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class SeriesDetailApi extends BaseApi {
  SeriesDetailApi({this.id});
  String id;

  @override
  String endpointPath() => '/api/v1/series/${id}';

  @override
  Map<String, dynamic> parseReponse(http.Response response) {
    if (response.statusCode == 200) {
      final jsonMap = json.decode(response.body) as Map<String, dynamic>;
      final result = {
        'data': seriesFromJson(jsonMap['data']),
      };

      return result;
    } else {
      log('errorStatus: ${response.statusCode}\n  requestUri:${response.request.url}');
      return null;
    }
  }
}
