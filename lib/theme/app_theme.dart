import 'dart:math';
import 'package:flutter/material.dart';
import 'package:innovation/theme/app_color.dart';
import 'package:innovation/utils/text_styles.dart';

final ThemeData appThemeData = ThemeData(
  primarySwatch: primaryswatch,
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.deepPurple,
  ),
  dialogTheme:
      DialogTheme(titleTextStyle: mainHeadSmall, contentTextStyle: subBody),
  pageTransitionsTheme: const PageTransitionsTheme(builders: {
    TargetPlatform.android: CupertinoPageTransitionsBuilder(),
  }),
  appBarTheme: AppBarTheme(
    centerTitle: true,
    elevation: 0.0,
    scrolledUnderElevation: 0,
    backgroundColor: AppColor.primaryColor,
    iconTheme: const IconThemeData(color: AppColor.white),
    titleTextStyle: mainBody.copyWith(color: AppColor.white),
  ),
  tabBarTheme: const TabBarTheme(
      labelColor: AppColor.secondaryColor,
      indicatorColor: AppColor.primaryColor),
  useMaterial3: true,
  
);

final primaryswatch = MaterialColor(AppColor.swatch.value, {
  50: tintColor(AppColor.swatch, 0.9),
  100: tintColor(AppColor.swatch, 0.8),
  200: tintColor(AppColor.swatch, 0.6),
  300: tintColor(AppColor.swatch, 0.4),
  400: tintColor(AppColor.swatch, 0.2),
  500: AppColor.swatch,
  600: shadeColor(AppColor.swatch, 0.1),
  700: shadeColor(AppColor.swatch, 0.2),
  800: shadeColor(AppColor.swatch, 0.3),
  900: shadeColor(AppColor.swatch, 0.4),
});

int tintValue(int value, double factor) =>
    max(0, min((value + ((255 - value) * factor)).round(), 255));

Color tintColor(Color color, double factor) => Color.fromRGBO(
    tintValue(color.red, factor),
    tintValue(color.green, factor),
    tintValue(color.blue, factor),
    1);

int shadeValue(int value, double factor) =>
    max(0, min(value - (value * factor).round(), 255));

Color shadeColor(Color color, double factor) => Color.fromRGBO(
    shadeValue(color.red, factor),
    shadeValue(color.green, factor),
    shadeValue(color.blue, factor),
    1);

const Gradient shimmerDarkGradient = LinearGradient(
  colors: [
    AppColor.black,
    Color.fromARGB(255, 51, 51, 51),
    AppColor.black,
    Color.fromARGB(255, 51, 51, 51)
  ],
);
const Gradient shimmerLightGradient = LinearGradient(
  colors: [
    Colors.white,
    Color.fromARGB(255, 222, 222, 222),
    Colors.white,
    Color.fromARGB(255, 222, 222, 222)
  ],
);
