import 'package:dart_speedrun_api/dart_speedrun_api.dart';
import 'package:test/test.dart';

void main() {
  group('Requests::Leaderboards::LeaderboardCategoryApi', () {
    group('Constructor', () {
      group('invalid', () {
        test('Case only record_id', () {
          expect(() {
            LeaderboardCategoryApi(record_id: 'pdvzq96w');
          }, throwsA(isA<AssertionError>()));
        });

        test('Case only category_id', () {
          expect(() {
            LeaderboardCategoryApi(category_id: 'z276ozd0');
          }, throwsA(isA<AssertionError>()));
        });
      });
    });

    group('#request()', () {
      LeaderboardCategoryApi _api;

      group('valid', () {
        test('Case default request', () async {
          _api = LeaderboardCategoryApi(
              record_id: 'pdvzq96w', category_id: 'z276ozd0');
          var leaderboardCategory = await _api.request();

          expect(leaderboardCategory['data'].runtimeType, Leaderboard);
        });

        test('Case with directUri member', () async {
          var directUri = Uri.parse(
              'https://www.speedrun.com/api/v1/leaderboards/pdvzq96w/category/z276ozd0');
          var _api = LeaderboardCategoryApi();
          var leaderboardCategory = await _api.request(directUri: directUri);

          expect(leaderboardCategory['data'].runtimeType, Leaderboard);
        });
      });

      group('invalid', () {
        test('Case status 200, but null data', () async {
          var directUri = Uri.parse(
              'https://www.speedrun.com/api/v1/leaderboards/invalid/category/invalid');
          var _api = LeaderboardCategoryApi();
          var leaderboardCategory = await _api.request(directUri: directUri);

          expect(leaderboardCategory, null);
        });
      });
    });
  });
}
