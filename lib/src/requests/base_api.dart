import 'dart:core';
import 'dart:developer';

import 'package:http/http.dart' as http;

abstract class InterfaceApi {
  Future<Map<String, dynamic>> request();
}

abstract class BaseApi implements InterfaceApi {
  static const _apiHost = 'www.speedrun.com';

  @override
  Future<Map<String, dynamic>> request(
      {Uri directUri, Map<String, dynamic> queryParameters}) async {
    final endpoint = _endpointUri(directUri, queryParameters);
    final response = await _requestEndpoint(endpoint);
    final result = _parseReponse(response);

    return result;
  }

  String endpointPath();

  Map<String, dynamic> parseJsonData(http.Response response);

  Uri _endpointUri([Uri directUri, Map<String, dynamic> queryParameters]) {
    final path = endpointPath();
    final defaultUri = Uri.https(_apiHost, path, queryParameters);

    return directUri ?? defaultUri;
  }

  Future<http.Response> _requestEndpoint(Uri uri) {
    return http.get(uri);
  }

  Map<String, dynamic> _parseReponse(http.Response response) {
    if (response.statusCode == 200) {
      return parseJsonData(response);
    } else {
      log('errorStatus: ${response.statusCode}\n  requestUri:${response.request.url}');
      return null;
    }
  }
}
