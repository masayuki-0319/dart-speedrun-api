import 'dart:convert';

import 'common/link.dart';

// To parse this JSON data, do
//
//     final category = categoryFromJson(jsonString);

Category categoryFromJson(Map<String, dynamic> json) => Category.fromJson(json);

String categoryToJson(Category data) => json.encode(data.toJson());

class Category {
  Category({
      this.id,
      this.name,
      this.weblink,
      this.type,
      this.rules,
      this.players,
      this.miscellaneous,
      this.links,
  });

  String id;
  String name;
  String weblink;
  String type;
  String rules;
  Players players;
  bool miscellaneous;
  List<Link> links;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
      id: json['id'],
      name: json['name'],
      weblink: json['weblink'],
      type: json['type'],
      rules: json['rules'],
      players: Players.fromJson(json['players']),
      miscellaneous: json['miscellaneous'],
      links: List<Link>.from(json['links'].map((x) => Link.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
      'id': id,
      'name': name,
      'weblink': weblink,
      'type': type,
      'rules': rules,
      'players': players.toJson(),
      'miscellaneous': miscellaneous,
      'links': List<dynamic>.from(links.map((x) => x.toJson())),
  };
}

class Players {
  Players({
      this.type,
      this.value,
  });

  String type;
  int value;

  factory Players.fromJson(Map<String, dynamic> json) => Players(
      type: json['type'],
      value: json['value'],
  );

  Map<String, dynamic> toJson() => {
      'type': type,
      'value': value,
  };
}
