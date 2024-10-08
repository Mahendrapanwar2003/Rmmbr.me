import 'package:flutter/material.dart';

abstract class AppColors {
  Color get primary;

  Color get onPrimary;

  Color get secondary;

  Color get onSecondary;

  Color get scaffoldBackgroundColor;

  Color get success;

  Color get error;

  Color get onError;

  Color get caption;

  Color get text;

  Color get onText;
}

class AppLightColors extends AppColors {
  @override
  Color get primary => const Color(0xff000000);

  @override
  Color get onPrimary => const Color(0xffFFFFFF);

  @override
  Color get secondary => const Color(0xff407FF8);

  @override
  Color get onSecondary => const Color(0xff18EEC0);

  @override
  Color get caption => const Color(0xff939393);

  @override
  Color get error => const Color(0xffFF4D4C);

  @override
  Color get onError => const Color(0xffFE294D);

  @override
  Color get onText => const Color(0xffFFFFFF);

  @override
  Color get scaffoldBackgroundColor => const Color(0xffF9F9F9);

  @override
  Color get text => const Color(0xff000000);

  @override
  // Color get success => const Color(0xff38E894);
  Color get success => const Color(0xff5AD439);
}

class AppDarkColors extends AppColors {
  @override
  Color get primary => const Color(0xff004A78);

  @override
  Color get onPrimary => const Color(0xffFFFFFF);

  @override
  Color get secondary => const Color(0xff407FF8);

  @override
  Color get onSecondary => const Color(0xff18EEC0);

  @override
  Color get caption => const Color(0xff939393);

  @override
  Color get error => const Color(0xffFF4D4C);

  @override
  Color get onError => const Color(0xffFE294D);

  @override
  Color get onText => const Color(0xffFFFFFF);

  @override
  Color get scaffoldBackgroundColor => const Color(0xffF9F9F9);

  @override
  Color get text => const Color(0xff000000);

  @override
  Color get success => const Color(0xff5AD439);
}
