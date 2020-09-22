import 'package:dart_speedrun_api/dart_speedrun_api.dart';
import 'package:test/test.dart';

void main() {
  group('Requests::Series', () {
    SeriesApi seriesApi;

    setUp(() {
      seriesApi = SeriesApi();
    });

    test('#requestList: GET api/v1/series', () async {
      var seriesList = await seriesApi.requestList();

      expect(seriesList[0].runtimeType, Series);
      expect(seriesList.whereType<Series>().length, 20);
    });

    test('#requestDetail: GET api/v1/series/:id', () async {
      var series = await seriesApi.requestDetail('rv7emz49');

      expect(series.runtimeType, Series);
    });

    test('#requestGames: GET api/v1/series/:id/games', () async {
      var seriesGames = await seriesApi.requestGames('rv7emz49');

      expect(seriesGames[0].runtimeType, Game);
      expect(seriesGames.whereType<Game>().length, 20);
    });
  });
}
