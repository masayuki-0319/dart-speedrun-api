import 'package:http/http.dart' as http;

abstract class BaseApi {
  static const _apiServiceHost = 'www.speedrun.com';

  Future<http.Response> getRequest(String apiPath, [Map<String, dynamic> options]) async {
    final endpoint = Uri.https(_apiServiceHost, apiPath, options);
    return await http.get(endpoint);
  }
}
