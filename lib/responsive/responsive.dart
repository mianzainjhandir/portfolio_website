
import 'package:flutter/material.dart';

class Responsive{

  static bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width <= 600;
  }
  static double widthOfScreen(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }
  static double heightOfScreen(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }
}

// from tomorrow i will really work properly again....