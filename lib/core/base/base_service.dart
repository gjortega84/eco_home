import 'package:logger/logger.dart';
class BaseService {
  Logger log;

  BaseService({String title}) {
    this.log = Logger(
  printer: PrettyPrinter(),
);

  }
}