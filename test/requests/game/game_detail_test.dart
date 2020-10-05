import 'package:dart_speedrun_api/dart_speedrun_api.dart';
import 'package:test/test.dart';

void main() {
  group('Requests::Game::GameDetailApi', () {
    GameDetailApi _api;

    group('#request()', () {
      group('valid', () {
        test('Case default request', () async {
          _api = GameDetailApi(id: 'v1pxjz68');
          var gameDetail = await _api.request();

          expect(gameDetail['data'].runtimeType, Game);
        });

        test('Case with directUri member', () async {
          var directUri = Uri.parse('https://www.speedrun.com/api/v1/games/v1pxjz68');
          var _api = GameDetailApi();
          var gameDetail = await _api.request(directUri: directUri);

          expect(gameDetail['data'].runtimeType, Game);
        });
      });

      group('invalid', () {
        test('Case status 200, but null data', () async {
          var directUri =
              Uri.parse('https://www.speedrun.com/api/v1/games/invalid');
          var _api = GameDetailApi();
          var gameDetail = await _api.request(directUri: directUri);

          expect(gameDetail, null);
        });
      });
    });
  });
}
