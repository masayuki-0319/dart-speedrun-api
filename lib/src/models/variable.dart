import 'dart:convert';

import 'common/link.dart';

// To parse this JSON data, do
//
//     final variable = variableFromJson(jsonString);

Variable variableFromJson(Map<String, dynamic> json) => Variable.fromJson(json);

String variableToJson(Variable data) => json.encode(data.toJson());

class Variable {
  Variable({
      this.id,
      this.name,
      this.category,
      this.scope,
      this.mandatory,
      this.userDefined,
      this.obsoletes,
      this.values,
      this.isSubcategory,
      this.links,
  });

  String id;
  String name;
  dynamic category;
  Scope scope;
  bool mandatory;
  bool userDefined;
  bool obsoletes;
  Map values;
  bool isSubcategory;
  List<Link> links;

  factory Variable.fromJson(Map<String, dynamic> json) => Variable(
      id: json['id'],
      name: json['name'],
      category: json['category'],
      scope: Scope.fromJson(json['scope']),
      mandatory: json['mandatory'],
      userDefined: json['user-defined'],
      obsoletes: json['obsoletes'],
      values: json['values'],
      isSubcategory: json['is-subcategory'],
      links: List<Link>.from(json['links'].map((x) => Link.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
      'id': id,
      'name': name,
      'category': category,
      'scope': scope.toJson(),
      'mandatory': mandatory,
      'user-defined': userDefined,
      'obsoletes': obsoletes,
      'values': values,
      'is-subcategory': isSubcategory,
      'links': List<dynamic>.from(links.map((x) => x.toJson())),
  };
}

class Scope {
  Scope({
      this.type,
  });

  String type;

  factory Scope.fromJson(Map<String, dynamic> json) => Scope(
      type: json['type'],
  );

  Map<String, dynamic> toJson() => {
      'type': type,
  };
}

class Values {
  Values({
      this.values,
      this.valuesDefault,
  });

  Map<String, Value> values;
  String valuesDefault;

  factory Values.fromJson(Map<String, dynamic> json) => Values(
      values: Map.from(json['values']).map((k, v) => MapEntry<String, Value>(k, Value.fromJson(v))),
      valuesDefault: json['default'],
  );

  Map<String, dynamic> toJson() => {
      'values': Map.from(values).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
      'default': valuesDefault,
  };
}

class Value {
  Value({
      this.label,
      this.rules,
      this.flags,
  });

  String label;
  String rules;
  Flags flags;

  factory Value.fromJson(Map<String, dynamic> json) => Value(
      label: json['label'],
      rules: json['rules'],
      flags: Flags.fromJson(json['flags']),
  );

  Map<String, dynamic> toJson() => {
      'label': label,
      'rules': rules,
      'flags': flags.toJson(),
  };
}

class Flags {
  Flags({
      this.miscellaneous,
  });

  bool miscellaneous;

  factory Flags.fromJson(Map<String, dynamic> json) => Flags(
      miscellaneous: json['miscellaneous'],
  );

  Map<String, dynamic> toJson() => {
      'miscellaneous': miscellaneous,
  };
}
