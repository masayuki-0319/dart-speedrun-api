// To parse this JSON data, do
//
//     final pagination = paginationFromJson(jsonString);

import 'dart:convert';

import 'common/link.dart';

Pagination paginationFromJson(Map<String, dynamic>  json) => Pagination.fromJson(json);

String paginationToJson(Pagination data) => json.encode(data.toJson());

class Pagination {
  Pagination({
    this.offset,
    this.max,
    this.size,
    this.links,
  });

  int offset;
  int max;
  int size;
  List<Link> links;

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
        offset: json['offset'],
        max: json['max'],
        size: json['size'],
        links: List<Link>.from(json['links'].map((x) => Link.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        'offset': offset,
        'max': max,
        'size': size,
        'links': List<dynamic>.from(links.map((x) => x.toJson())),
      };
}
