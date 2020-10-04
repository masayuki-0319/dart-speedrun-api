import 'package:dart_speedrun_api/dart_speedrun_api.dart';
import 'package:test/test.dart';

void main() {
  group('Requests::Series::SeriesDetailApi', () {
    SeriesDetailApi _api;

    group('#request()', () {
      group('valid', () {
        test('Case default request', () async {
          _api = SeriesDetailApi(id: 'rv7emz49');
          var seriesDetail = await _api.request();

          expect(seriesDetail['data'].runtimeType, Series);
        });

        test('Case with directUri member', () async {
          var directUri = Uri.parse('https://www.speedrun.com/api/v1/series/rv7emz49');
          var _api = SeriesDetailApi();
          var seriesDetail = await _api.request(directUri);

          expect(seriesDetail['data'].runtimeType, Series);
        });
      });

      group('invalid', () {
        test('Case status 200, but null data', () async {
          var directUri =
              Uri.parse('https://www.speedrun.com/api/v1/series/invalid');
          var _api = SeriesDetailApi();
          var seriesDetail = await _api.request(directUri);

          expect(seriesDetail, null);
        });
      });
    });
  });
}
