import 'package:flutter/material.dart';

class ThemeColors {
  ThemeColors._(); // Prevents class from being instantiated

  static const Color primary = Color(0xFF29B6F6);
  static const Color primaryDark = Color(0xFF0277BD);
  static const Color primaryLight = Color(0xFFE1F5FE);

  static const Color black = Color(0xFF000000);
  static const Color greyDark = Color(0xFF616161);
  static const Color grey = Color(0xFFBDBDBD);
  static const Color greyLight = Color(0xFFEEEEEE);
  static const Color white = Color(0xFFFFFFFF);

  static const Color success = Color(0xFF28A745);
  static const Color warning = Color(0xFFFFC107);
  static const Color danger = Color(0xFFDC3545);
}

class DiamondTypography {
  DiamondTypography._();

  static const String regularFont = "SF Pro Display";
  static const String monoFont = "SF Mono";

  static const List<TextStyle> headingBlack = [
    TextStyle(
      fontFamily: regularFont,
      fontSize: 36.0,
      color: ThemeColors.black,
    ),
    TextStyle(
      fontFamily: regularFont,
      fontSize: 36.0,
      color: ThemeColors.black,
    ),
    TextStyle(
      fontFamily: regularFont,
      fontSize: 36.0,
      color: ThemeColors.black,
    ),
    TextStyle(
      fontFamily: regularFont,
      fontSize: 36.0,
      color: ThemeColors.black,
    ),
    TextStyle(
      fontFamily: regularFont,
      fontSize: 36.0,
      color: ThemeColors.black,
    ),
    TextStyle(
      fontFamily: regularFont,
      fontSize: 36.0,
      color: ThemeColors.black,
    ),
  ];
  static const List<TextStyle> headingWhite = [
    TextStyle(
      fontFamily: regularFont,
      fontSize: 36.0,
      color: ThemeColors.white,
    ),
    TextStyle(
      fontFamily: regularFont,
      fontSize: 36.0,
      color: ThemeColors.white,
    ),
    TextStyle(
      fontFamily: regularFont,
      fontSize: 36.0,
      color: ThemeColors.white,
    ),
    TextStyle(
      fontFamily: regularFont,
      fontSize: 36.0,
      color: ThemeColors.white,
    ),
    TextStyle(
      fontFamily: regularFont,
      fontSize: 36.0,
      color: ThemeColors.white,
    ),
    TextStyle(
      fontFamily: regularFont,
      fontSize: 36.0,
      color: ThemeColors.white,
    ),
  ];

  static const TextStyle subtitleBlack = TextStyle(
    fontFamily: regularFont,
    fontSize: 36.0,
    color: ThemeColors.black,
  );
  static const TextStyle subtitleWhite = TextStyle(
    fontFamily: regularFont,
    fontSize: 36.0,
    color: ThemeColors.white,
  );

  static const TextStyle bodyBlack = TextStyle(
    fontFamily: regularFont,
    fontSize: 36.0,
    color: ThemeColors.black,
  );
  static const TextStyle bodyWhite = TextStyle(
    fontFamily: regularFont,
    fontSize: 36.0,
    color: ThemeColors.white,
  );

  static const TextStyle actionTextBlack = TextStyle(
    fontFamily: regularFont,
    fontSize: 36.0,
    color: ThemeColors.black,
  );
  static const TextStyle actionTextWhite = TextStyle(
    fontFamily: regularFont,
    fontSize: 36.0,
    color: ThemeColors.white,
  );

  static const TextStyle captionBlack = TextStyle(
    fontFamily: regularFont,
    fontSize: 36.0,
    color: ThemeColors.black,
  );
  static const TextStyle captionWhite = TextStyle(
    fontFamily: regularFont,
    fontSize: 36.0,
    color: ThemeColors.white,
  );

  static const TextStyle overlineBlack = TextStyle(
    fontFamily: regularFont,
    fontSize: 36.0,
    color: ThemeColors.black,
  );
  static const TextStyle overlineWhite = TextStyle(
    fontFamily: regularFont,
    fontSize: 36.0,
    color: ThemeColors.white,
  );

  static const TextStyle monoBlack = TextStyle(
    fontFamily: monoFont,
    fontSize: 18.0,
    color: ThemeColors.black,
  );
  static const TextStyle monoWhite = TextStyle(
    fontFamily: monoFont,
    fontSize: 18.0,
    color: ThemeColors.white,
  );
}
