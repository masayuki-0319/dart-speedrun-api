import 'dart:convert';

import 'common/link.dart';

// To parse this JSON data, do
//
//     final level = levelFromJson(jsonString);

Level levelFromJson(Map<String, dynamic> json) => Level.fromJson(json);

String levelToJson(Level data) => json.encode(data.toJson());

class Level {
  Level({
      this.id,
      this.name,
      this.weblink,
      this.rules,
      this.links,
  });

  String id;
  String name;
  String weblink;
  String rules;
  List<Link> links;

  factory Level.fromJson(Map<String, dynamic> json) => Level(
      id: json['id'],
      name: json['name'],
      weblink: json['weblink'],
      rules: json['rules'],
      links: List<Link>.from(json['links'].map((x) => Link.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
      'id': id,
      'name': name,
      'weblink': weblink,
      'rules': rules,
      'links': List<dynamic>.from(links.map((x) => x.toJson())),
  };
}
