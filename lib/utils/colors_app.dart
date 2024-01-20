import 'dart:math';

import 'package:flutter/material.dart';

class ColorApp{
  static Color get bgPrimary => const Color(0xFFF1EBEB);
  static Color get bgSecondary => const Color(0xFFeee8e8);
  static Color get bgGreyDark => const Color(0xFFcacaca);
  static Color get secondColor => const Color(0xFF24c0eb);
  static Color get appBarColor =>  Colors.blue.shade300;
  static Color get ramdomColor => Color((Random().nextDouble() * 0xFFFFFF).toInt() << 0).withOpacity(1.0);
  
}