class Logger {
  static bool disableGlobalLog = false;

  static final Logger _logger = Logger._internal();

  factory Logger() => _logger;

  Logger._internal();

  static void log(dynamic object, {disableLocalLog = false}) {
    if (disableGlobalLog || disableLocalLog) return;

    // ignore: avoid_print
    print(object);
  }
}
