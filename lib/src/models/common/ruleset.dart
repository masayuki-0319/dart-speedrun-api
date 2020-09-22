class Ruleset {
  Ruleset({
    this.showMilliseconds,
    this.requireVerification,
    this.requireVideo,
    this.runTimes,
    this.defaultTime,
    this.emulatorsAllowed,
  });

  bool showMilliseconds;
  bool requireVerification;
  bool requireVideo;
  List<String> runTimes;
  String defaultTime;
  bool emulatorsAllowed;

  factory Ruleset.fromJson(Map<String, dynamic> json) => Ruleset(
    showMilliseconds: json['show-milliseconds'],
    requireVerification: json['require-verification'],
    requireVideo: json['require-video'],
    runTimes: List<String>.from(json['run-times'].map((x) => x)),
    defaultTime: json['default-time'],
    emulatorsAllowed: json['emulators-allowed'],
  );

  Map<String, dynamic> toJson() => {
    'show-milliseconds': showMilliseconds,
    'require-verification': requireVerification,
    'require-video': requireVideo,
    'run-times': List<dynamic>.from(runTimes.map((x) => x)),
    'default-time': defaultTime,
    'emulators-allowed': emulatorsAllowed,
  };
}
