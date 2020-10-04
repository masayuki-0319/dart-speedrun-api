import 'package:dart_speedrun_api/dart_speedrun_api.dart';

void main() async {
  var _seriesId = 'rv7emz49';
  var _api = SeriesDetailApi(id: _seriesId);
  var _seriesResponse = await _api.request();

  var seriesObject = _seriesResponse['data'];

  print('{ ID: ${_seriesId} } is the series name of the ${seriesObject.names.international}');
}
