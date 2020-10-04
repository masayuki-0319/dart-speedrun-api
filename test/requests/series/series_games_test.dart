import 'package:dart_speedrun_api/dart_speedrun_api.dart';
import 'package:test/test.dart';

void main() {
  group('Requests::Series::SeriesGamesApi', () {
    SeriesGamesApi _api;

    group('#request()', () {
      group('valid', () {
        test('Case default request', () async {
          _api = SeriesGamesApi(id: 'rv7emz49');
          var seriesGames = await _api.request();

          expect(seriesGames['data'].whereType<Game>().length, 20);
          expect(seriesGames['pagination'].runtimeType, Pagination);
        });

        test('Case with directUri member', () async {
          var directUri = Uri.parse('https://www.speedrun.com/api/v1/series/rv7emz49/games');
          var _api = SeriesGamesApi();
          var seriesGames = await _api.request(directUri: directUri);

          expect(seriesGames['data'].whereType<Game>().length, 20);
          expect(seriesGames['pagination'].runtimeType, Pagination);
        });
      });

      group('invalid', () {
        test('Case status 200, but null data', () async {
          var directUri =
              Uri.parse('https://www.speedrun.com/api/v1/series/invalid/games');
          var _api = SeriesGamesApi();
          var seriesGames = await _api.request(directUri: directUri);

          expect(seriesGames, null);
        });
      });
    });
  });
}
