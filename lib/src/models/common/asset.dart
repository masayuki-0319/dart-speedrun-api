class Asset {
  Asset({
    this.uri,
    this.width,
    this.height,
  });

  String uri;
  int width;
  int height;

  factory Asset.fromJson(Map<String, dynamic> json) => Asset(
    uri: json['uri'],
    width: json['width'],
    height: json['height'],
  );

  Map<String, dynamic> toJson() => {
    'uri': uri,
    'width': width,
    'height': height,
  };
}
