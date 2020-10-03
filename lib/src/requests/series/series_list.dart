import '../base_api.dart';
import '../../models/series.dart';
import '../../models/pagination.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class SeriesListApi extends BaseApi {
  SeriesListApi({
    this.directUri,
  });

  // TODO: assert for difference endpoint.
  Uri directUri;

  @override
  Uri endpointUri([Map<String, dynamic> options]) {
    final endpointPath = '/api/v1/series';

    return Uri.https(BaseApi.apiHost, endpointPath, options);
  }

  @override
  Future<http.Response> requestEndpoint([Map<String, dynamic> options]) {
    final url = directUri ?? endpointUri(options);

    return http.get(url);
  }

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
      return null;
    }
  }
}
