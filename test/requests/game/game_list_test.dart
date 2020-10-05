import 'package:dart_speedrun_api/dart_speedrun_api.dart';
import 'package:test/test.dart';

void main() {
  group('Requests::Games::GameListApi', () {
    GameListApi _api;

    group('#request()', () {
      group('valid', () {
        test('Case default request', () async {
          _api = GameListApi();
          var gameList = await _api.request();

          expect(gameList['data'].whereType<Game>().length, 20);
          expect(gameList['pagination'].runtimeType, Pagination);
        });

        test('Case with directUri member', () async {
          var directUri = Uri.parse('https://www.speedrun.com/api/v1/games?offset=20');
          var _api = GameListApi();
          var gameList = await _api.request(directUri: directUri);

          expect(gameList['data'].whereType<Game>().length, 20);
          expect(gameList['pagination'].runtimeType, Pagination);
        });
      });

      group('invalid', () {
        test('Case status 200, but null data', () async {
          var directUri =
              Uri.parse('https://www.speedrun.com/api/v1/games?name=invalid');
          var _api = GameListApi();
          var gameList = await _api.request(directUri: directUri);

          expect(gameList['data'], []);
          expect(gameList['pagination'].runtimeType, Pagination);
        });
      });
    });
  });
}
