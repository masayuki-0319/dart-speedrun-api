import 'package:dart_speedrun_api/dart_speedrun_api.dart';
import 'package:test/test.dart';

void main() {
  group('Requests::Games::GameVariablesApi', () {
    GameVariablesApi _api;

    group('#request()', () {
      group('valid', () {
        test('Case default request', () async {
          _api = GameVariablesApi(id: 'v1pxjz68');
          var gameVariables = await _api.request();

          expect(gameVariables['data'].whereType<Variable>().length, 7);
        });

        test('Case with directUri member', () async {
          var directUri = Uri.parse('https://www.speedrun.com/api/v1/games/v1pxjz68/variables');
          var _api = GameVariablesApi();
          var gameVariables = await _api.request(directUri: directUri);

          expect(gameVariables['data'].whereType<Variable>().length, 7);
        });
      });
    });
  });
}
