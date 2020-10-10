import 'package:dart_speedrun_api/dart_speedrun_api.dart';
import 'package:test/test.dart';

void main() {
  group('Requests::Category::CategoryDetailApi', () {
    CategoryDetailApi _api;

    group('#request()', () {
      group('valid', () {
        test('Case default request', () async {
          _api = CategoryDetailApi(id: 'nxd1rk8q');
          var categoryDetail = await _api.request();

          expect(categoryDetail['data'].runtimeType, Category);
        });

        test('Case with directUri member', () async {
          var directUri = Uri.parse('https://www.speedrun.com/api/v1/categories/nxd1rk8q');
          var _api = CategoryDetailApi();
          var categoryDetail = await _api.request(directUri: directUri);

          expect(categoryDetail['data'].runtimeType, Category);
        });
      });

      group('invalid', () {
        test('Case status 200, but null data', () async {
          var directUri =
              Uri.parse('https://www.speedrun.com/api/v1/categories/invalid');
          var _api = CategoryDetailApi();
          var categoryDetail = await _api.request(directUri: directUri);

          expect(categoryDetail, null);
        });
      });
    });
  });
}
