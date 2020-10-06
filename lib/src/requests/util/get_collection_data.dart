import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../models/pagination.dart';

mixin GetCollectionData {
  Map<String, dynamic> getCollectionData(http.Response response, Function modelFromJson) {
    final jsonMap = json.decode(response.body) as Map<String, dynamic>;
    final result = {
      'data': jsonMap['data'].map((json) => modelFromJson(json)).toList(),
      'pagination': paginationFromJson(jsonMap['pagination']),
    };

    return result;
  }
}
