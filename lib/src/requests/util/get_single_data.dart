import 'package:http/http.dart' as http;
import 'dart:convert';

mixin GetSingleData {
  Map<String, dynamic> getSingleData(http.Response response, Function modelFromJson) {
    final jsonMap = json.decode(response.body) as Map<String, dynamic>;
    final result = {
      'data': modelFromJson(jsonMap['data']),
    };

    return result;
  }
}
