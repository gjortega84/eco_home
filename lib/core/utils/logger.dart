import 'package:logger/logger.dart';
import 'dart:developer' as prefix0;

class SimpleLogPrinter extends LogPrinter {
  static int counter = 0;
  final String className;

  SimpleLogPrinter(this.className);



Logger getLogger(String className) {
  return Logger(printer: SimpleLogPrinter(className));
}

  @override
  List<String> log(LogEvent event) {
    prefix0.log(
      event.message,
      time: DateTime.now(),
      level: () {
        switch (event.level) {
          case Level.verbose:
            return 0;
          case Level.debug:
            return 500;
          case Level.info:
            return 0;
          case Level.warning:
            return 1500;
          case Level.error:
            return 2000;
          case Level.wtf:
            return 2000;
          default:
            return 2000;
        }
      }(),
      name: className,
      error: event.error,
    );
    throw UnimplementedError();
  }
  }