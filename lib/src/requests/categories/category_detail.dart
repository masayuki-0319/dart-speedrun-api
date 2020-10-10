import 'package:http/http.dart' as http;

import '../base_api.dart';
import '../util/get_single_data.dart';
import '../../models/category.dart';

class CategoryDetailApi extends BaseApi with GetSingleData {
  CategoryDetailApi({this.id});
  String id;

  @override
  String endpointPath() => '/api/v1/categories/${id}';

  @override
  Map<String, dynamic> parseJsonData(http.Response response) {
    return getSingleData(response, categoryFromJson);
  }
}
