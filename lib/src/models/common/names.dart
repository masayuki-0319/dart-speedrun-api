class Names {
  Names({
    this.international,
    this.japanese,
    this.twitch,
  });

  String international;
  String japanese;
  String twitch;

  factory Names.fromJson(Map<String, dynamic> json) => Names(
    international: json['international'],
    japanese: json['japanese'],
    twitch: json['twitch'],
  );

  Map<String, dynamic> toJson() => {
    'international': international,
    'japanese': japanese,
    'twitch': twitch,
  };
}
