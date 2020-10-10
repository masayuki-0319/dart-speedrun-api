import 'package:dart_speedrun_api/dart_speedrun_api.dart';
import 'package:test/test.dart';

void main() {
  group('Requests::Category::CategoryVariablesApi', () {
    CategoryVariablesApi _api;

    group('#request()', () {
      group('valid', () {
        test('Case default request', () async {
          _api = CategoryVariablesApi(id: 'xd1m7rd8');
          var categoryVariables = await _api.request();

          expect(categoryVariables['data'].whereType<Variable>().length, 2);
        });

        test('Case with directUri member', () async {
          var directUri = Uri.parse('https://www.speedrun.com/api/v1/categories/xd1m7rd8/variables');
          var _api = CategoryVariablesApi();
          var categoryVariables = await _api.request(directUri: directUri);

          expect(categoryVariables['data'].whereType<Variable>().length, 2);
        });
      });

      group('invalid', () {
        test('Case status 200, but null data', () async {
          var directUri =
              Uri.parse('https://www.speedrun.com/api/v1/categories/invalid');
          var _api = CategoryVariablesApi();
          var categoryVariables = await _api.request(directUri: directUri);

          expect(categoryVariables, null);
        });
      });
    });
  });
}
