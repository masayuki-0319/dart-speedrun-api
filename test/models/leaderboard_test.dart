import 'dart:convert';

import 'package:dart_speedrun_api/dart_speedrun_api.dart';
import 'package:test/test.dart';

import 'dart:io' as file;

void main() {
  group('Models::Leaderboard', () {
    test('.fromJson', () {
      var filePath = 'test/dummy_files/leaderboard_detail.json';
      var jsonString = file.File(filePath).readAsStringSync();
      var jsonData = json.decode(jsonString);
      var mainData = jsonData;

      expect(Leaderboard.fromJson(mainData).runtimeType, Leaderboard);
    });
  });
}
