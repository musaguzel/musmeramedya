import 'dart:math';

import 'package:flutter/material.dart';
import '../init/theme/app_theme.dart';
import '../init/theme/text_theme.dart';

extension ContextExtension on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);
}

extension MediaQueryExtension on BuildContext {
  double get height => mediaQuery.size.height;
  double get width => mediaQuery.size.width;

  double get lowValue => height * 0.01;
  double get normalValue => height * 0.02;
  double get mediumValue => height * 0.04;
  double get highValue => height * 0.1;
}

extension ThemeExtension on BuildContext {
  ThemeData get theme => MyAppTheme;
  MyTextTheme? get textTheme => MyTextTheme.instance;
  ColorScheme get colors => theme.colorScheme;
}

extension PlatformExtension on BuildContext {
  bool get isIos => Theme.of(this).platform == TargetPlatform.iOS;
}

extension PaddingExtensionAll on BuildContext {
  EdgeInsets get paddingLow => EdgeInsets.all(lowValue);
  EdgeInsets get paddingNormal => EdgeInsets.all(normalValue);
  EdgeInsets get paddingMedium => EdgeInsets.all(mediumValue);
  EdgeInsets get paddingHigh => EdgeInsets.all(highValue);
}

extension PaddingExtensionSymetric on BuildContext {
  EdgeInsets get paddingLowVertical => EdgeInsets.symmetric(vertical: lowValue);
  EdgeInsets get paddingNormalVertical =>
      EdgeInsets.symmetric(vertical: normalValue);
  EdgeInsets get paddingMediumVertical =>
      EdgeInsets.symmetric(vertical: mediumValue);
  EdgeInsets get paddingHighVertical =>
      EdgeInsets.symmetric(vertical: highValue);

  EdgeInsets get paddingLowHorizontal =>
      EdgeInsets.symmetric(horizontal: lowValue);
  EdgeInsets get paddingNormalHorizontal =>
      EdgeInsets.symmetric(horizontal: normalValue);
  EdgeInsets get paddingMediumHorizontal =>
      EdgeInsets.symmetric(horizontal: mediumValue);
  EdgeInsets get paddingHighHorizontal =>
      EdgeInsets.symmetric(horizontal: highValue);
}

extension PageExtension on BuildContext {
  Color get randomColor => Colors.primaries[Random().nextInt(17)];
}


extension DurationExtension on BuildContext {
  Duration get lowDuration => const Duration(milliseconds: 500);
  Duration get normalDuration => const Duration(seconds: 1);
}

extension RandomColorSchemeExtension on BuildContext {
  List<Color> get colorizeColors {
    final colorScheme1 = [
      const Color(0xff64CCC5),
      const Color(0xff176B87),
      const Color(0xff053B50),
      const Color(0xffEEEEEE),
    ];
    final colorScheme2 = [
      Colors.purple,
      Colors.blue,
      Colors.teal,
      Colors.pink,
    ];
    final colorScheme3 = [
      const Color(0xff45FFCA),
      const Color(0xffFEFFAC),
      const Color(0xffFFB6D9),
      const Color(0xffD67BFF),
    ];
    final colorScheme4 = [
      const Color(0xffFFF5E0),
      const Color(0xffFF6969),
      const Color(0xffBB2525),
      const Color(0xff141E46),
    ];
    final colorScheme5 = [
      const Color(0xffFFDBC3),
      const Color(0xff9F91CC),
      const Color(0xff5C4B99),
      const Color(0xff3D246C),
    ];
    final colorScheme6 = [
      const Color(0xffFF9EAA),
      const Color(0xff3AA6B9),
      const Color(0xffFFD0D0),
      const Color(0xffC1ECE4),
    ];

    int randomNumber = Random().nextInt(6) + 1;
    switch (randomNumber) {
      case 1:
        return colorScheme1;
      case 2:
        return colorScheme2;
      case 3:
        return colorScheme3;
      case 4:
        return colorScheme4;
      case 5:
        return colorScheme5;
      case 6:
        return colorScheme6;

      default:
        return colorScheme2;
    }
  }
}
