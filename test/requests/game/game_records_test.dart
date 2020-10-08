import 'package:dart_speedrun_api/dart_speedrun_api.dart';
import 'package:test/test.dart';

void main() {
  group('Requests::Games::GameRecordsApi', () {
    GameRecordsApi _api;

    group('#request()', () {
      group('valid', () {
        test('Case default request', () async {
          _api = GameRecordsApi(id: 'v1pxjz68');
          var gameRecords = await _api.request();

          expect(gameRecords['data'].whereType<Leaderboard>().length, 20);
          expect(gameRecords['pagination'].runtimeType, Pagination);
        });

        test('Case with directUri member', () async {
          var directUri = Uri.parse('https://www.speedrun.com/api/v1/games/v1pxjz68/records');
          var _api = GameRecordsApi();
          var gameRecords = await _api.request(directUri: directUri);

          expect(gameRecords['data'].whereType<Leaderboard>().length, 20);
          expect(gameRecords['pagination'].runtimeType, Pagination);
        });
      });
    });
  });
}
