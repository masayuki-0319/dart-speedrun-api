import 'package:dart_speedrun_api/dart_speedrun_api.dart';
import 'package:test/test.dart';

void main() {
  group('Requests::Games::GameDerivedGamesApi', () {
    GameDerivedGamesApi _api;

    group('#request()', () {
      group('valid', () {
        test('Case default request', () async {
          _api = GameDerivedGamesApi(id: 'v1pxjz68');
          var gameDerivedGames = await _api.request();

          expect(gameDerivedGames['data'].whereType<Game>().length, 4);
        });

        test('Case with directUri member', () async {
          var directUri = Uri.parse('https://www.speedrun.com/api/v1/games/v1pxjz68/derived-games');
          var _api = GameDerivedGamesApi();
          var gameDerivedGames = await _api.request(directUri: directUri);

          expect(gameDerivedGames['data'].whereType<Game>().length, 4);
        });
      });
    });
  });
}
