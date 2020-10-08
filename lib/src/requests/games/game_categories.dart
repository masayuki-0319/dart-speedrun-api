import 'package:http/http.dart' as http;

import '../base_api.dart';
import '../util/get_collection_data.dart';
import '../../models/category.dart';

class GameCategoriesApi extends BaseApi with GetCollectionData {
  GameCategoriesApi({this.id});
  String id;

  @override
  String endpointPath() => '/api/v1/games/${id}/categories';

  @override
  Map<String, dynamic> parseJsonData(http.Response response) {
    return getCollectionData(response, categoryFromJson);
  }
}
