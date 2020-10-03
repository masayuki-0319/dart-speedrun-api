import 'dart:core';

import 'package:http/http.dart' as http;

abstract class InterfaceApi {
  Future<Map<String, dynamic>> request();
}

abstract class BaseApi implements InterfaceApi {
  static const _apiHost = 'www.speedrun.com';

  @override
  Future<Map<String, dynamic>> request(
      [Uri directUri, Map<String, dynamic> queryParameters]) async {
    final endpoint = _endpointUri(directUri, queryParameters);
    final response = await _requestEndpoint(endpoint);
    final result = parseReponse(response);

    return result;
  }

  String endpointPath();
  Map<String, dynamic> parseReponse(http.Response response);

  Uri _endpointUri([Uri directUri, Map<String, dynamic> queryParameters]) {
    final path = endpointPath();
    final defaultUri = Uri.https(_apiHost, path, queryParameters);

    if (directUri != null && defaultUri.path != directUri.path) {
      throw 'Invalid argument: defaultUri differ endpoint path';
    }

    return directUri ?? defaultUri;
  }

  Future<http.Response> _requestEndpoint(Uri uri) {
    return http.get(uri);
  }
}
