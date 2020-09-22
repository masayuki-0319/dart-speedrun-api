class Link {
  Link({
    this.rel,
    this.uri,
  });

  String rel;
  String uri;

  factory Link.fromJson(Map<String, dynamic> json) => Link(
    rel: json['rel'],
    uri: json['uri'],
  );

  Map<String, dynamic> toJson() => {
    'rel': rel,
    'uri': uri,
  };
}
