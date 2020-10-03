import 'dart:core';

import 'package:http/http.dart' as http;

abstract class InterfaceApi {
  Future<Map<String, dynamic>> request();
}

abstract class BaseApi implements InterfaceApi {
  static const apiHost = 'www.speedrun.com';

  Uri endpointUri(Map<String, dynamic> options);
  Future<http.Response> requestEndpoint();
  Map<String, dynamic> parseReponse(http.Response response);

  @override
  Future<Map<String, dynamic>> request() async {
    final response = await requestEndpoint();
    return parseReponse(response);
  }
}
