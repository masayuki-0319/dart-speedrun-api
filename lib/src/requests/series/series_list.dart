import 'dart:developer';

import '../base_api.dart';
import '../../models/series.dart';
import '../../models/pagination.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class SeriesListApi extends BaseApi {
  @override
  String endpointPath() => '/api/v1/series';

  @override
  Map<String, dynamic> parseReponse(http.Response response) {
    if (response.statusCode == 200) {
      final jsonMap = json.decode(response.body) as Map<String, dynamic>;
      final result = {
        'data': jsonMap['data'].map((json) => seriesFromJson(json)).toList(),
        'pagination': paginationFromJson(jsonMap['pagination']),
      };

      return result;
    } else {
      log('errorStatus: ${response.statusCode}\n  requestUri:${response.request.url}');
      return null;
    }
  }
}
