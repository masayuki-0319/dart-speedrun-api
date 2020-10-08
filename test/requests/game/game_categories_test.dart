import 'package:dart_speedrun_api/dart_speedrun_api.dart';
import 'package:test/test.dart';

void main() {
  group('Requests::Games::GameCategoriesApi', () {
    GameCategoriesApi _api;

    group('#request()', () {
      group('valid', () {
        test('Case default request', () async {
          _api = GameCategoriesApi(id: 'v1pxjz68');
          var gameCatetories = await _api.request();

          expect(gameCatetories['data'].whereType<Category>().length, 9);
        });

        test('Case with directUri member', () async {
          var directUri = Uri.parse('https://www.speedrun.com/api/v1/games/v1pxjz68/categories');
          var _api = GameCategoriesApi();
          var gameCatetories = await _api.request(directUri: directUri);

          expect(gameCatetories['data'].whereType<Category>().length, 9);
        });
      });
    });
  });
}
