import 'dart:math';

import 'package:flutter/widgets.dart';

class Responsive {
  double _height, _width, _diagonal;

  Responsive(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    _height = size.height;
    _width = size.width;
    _diagonal = sqrt(pow(_height, 2) + pow(_width, 2));
  }

  static Responsive of(BuildContext context) => Responsive(context);
  
  double get height => _height;
  double get width => _width;
  double get diagonal => _diagonal;

  double widthPercent(double percent) => _width * percent;
  double heightPercent(double percent) => _height * percent;
  double diagPercent(double percent) => _diagonal * percent;
}
