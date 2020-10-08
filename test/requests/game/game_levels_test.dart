import 'package:dart_speedrun_api/dart_speedrun_api.dart';
import 'package:test/test.dart';

void main() {
  group('Requests::Games::GameLevelsApi', () {
    GameLevelsApi _api;

    group('#request()', () {
      group('valid', () {
        test('Case default request', () async {
          _api = GameLevelsApi(id: 'v1pxjz68');
          var gameLevels = await _api.request();

          expect(gameLevels['data'].whereType<Level>().length, 14);
        });

        test('Case with directUri member', () async {
          var directUri = Uri.parse('https://www.speedrun.com/api/v1/games/v1pxjz68/levels');
          var _api = GameLevelsApi();
          var gameLevels = await _api.request(directUri: directUri);

          expect(gameLevels['data'].whereType<Level>().length, 14);
        });
      });
    });
  });
}
