import 'package:dart_speedrun_api/dart_speedrun_api.dart';

void main() async {
  var seriesApi = SeriesApi();
  var seriesId = 'rv7emz49';
  var series = await seriesApi.requestDetail(seriesId);

  print('{ ID: ${seriesId} } is the series name of the ${series.names.international}');
}
