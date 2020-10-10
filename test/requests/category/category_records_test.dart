import 'package:dart_speedrun_api/dart_speedrun_api.dart';
import 'package:test/test.dart';

void main() {
  group('Requests::Category::CategoryRecordsApi', () {
    CategoryRecordsApi _api;

    group('#request()', () {
      group('valid', () {
        test('Case default request', () async {
          _api = CategoryRecordsApi(id: 'xd1m7rd8');
          var categoryRecords = await _api.request();

          expect(categoryRecords['data'].whereType<Leaderboard>().length, 1);
        });

        test('Case with directUri member', () async {
          var directUri = Uri.parse('https://www.speedrun.com/api/v1/categories/xd1m7rd8/records');
          var _api = CategoryRecordsApi();
          var categoryRecords = await _api.request(directUri: directUri);

          expect(categoryRecords['data'].whereType<Leaderboard>().length, 1);
        });
      });

      group('invalid', () {
        test('Case status 200, but null data', () async {
          var directUri =
              Uri.parse('https://www.speedrun.com/api/v1/categories/invalid');
          var _api = CategoryRecordsApi();
          var categoryRecords = await _api.request(directUri: directUri);

          expect(categoryRecords, null);
        });
      });
    });
  });
}
