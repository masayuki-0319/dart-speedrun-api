import 'package:dart_speedrun_api/dart_speedrun_api.dart';
import 'package:test/test.dart';

void main() {
  group('Requests::Series::SeriesListApi', () {
    SeriesListApi _api;

    group('#request()', () {
      group('valid', () {
        test('Case default request', () async {
          _api = SeriesListApi();
          var seriesList = await _api.request();

          expect(seriesList['data'].whereType<Series>().length, 20);
          expect(seriesList['pagination'].runtimeType, Pagination);
        });

        test('Case with directUri member', () async {
          var directUri = Uri.parse('https://www.speedrun.com/api/v1/series?offset=20');
          var _api = SeriesListApi();
          var seriesList = await _api.request(directUri);

          expect(seriesList['data'].whereType<Series>().length, 20);
          expect(seriesList['pagination'].runtimeType, Pagination);
        });
      });

      group('invalid', () {
        test('Case status 200, but null data', () async {
          var directUri =
              Uri.parse('https://www.speedrun.com/api/v1/series?name=invalid');
          var _api = SeriesListApi();
          var seriesList = await _api.request(directUri);

          expect(seriesList['data'], []);
          expect(seriesList['pagination'].runtimeType, Pagination);
        });
      });
    });
  });
}
