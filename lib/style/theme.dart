import 'dart:ui';

import 'package:flutter/cupertino.dart';

class Colors {

  const Colors();

  static const Color loginGradientStart = const  Color(0xFF000102);
  static const Color loginGradientEnd = const Color(0xFF304d6d);
  static const Color maincolor = const  Color(0xFF304D6D);
  static const Color secondrycolor = const  Color(0xFF82A0BC);
  static const Color secondrycolor2 = const  Color(0xFF86D1EE);
  static const Color secondrycolor3 = const  Color(0xFF545E75);


  static const primaryGradient = const LinearGradient(
    colors: const [loginGradientStart, loginGradientEnd],
    stops: const [0.0, 1.0],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}