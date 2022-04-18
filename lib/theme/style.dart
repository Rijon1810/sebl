import 'package:flutter/material.dart';

ThemeData appTheme = ThemeData(
  fontFamily: 'ProductSans',
  scaffoldBackgroundColor: Colors.white,
  primaryColor: const Color(0xff509C98),

  ///appBar theme
  appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      iconTheme: const IconThemeData(color: Colors.black),
      textTheme: const TextTheme(
              bodyText1: TextStyle(
                  fontSize: 17,
                  fontFamily: 'ProductSans',
                  fontWeight: FontWeight.bold))
          .apply(
              bodyColor: Colors.black,
              displayColor: Colors.black,
              fontFamily: 'ProductSans')),

  ///text theme
  textTheme: const TextTheme(
          bodyText1: TextStyle(),
          button: TextStyle(fontWeight: FontWeight.w600),
          headline2: TextStyle(fontSize: 14, color: Color(0xff509C98)))
      .apply(bodyColor: Colors.black),
);

/// NAME         SIZE  WEIGHT  SPACING
/// headline1    96.0  light   -1.5
/// headline2    60.0  light   -0.5
/// headline3    48.0  regular  0.0
/// headline4    34.0  regular  0.25
/// headline5    24.0  regular  0.0
/// headline6    20.0  medium   0.15
/// subtitle1    16.0  regular  0.15
/// subtitle2    14.0  medium   0.1
/// body1        16.0  regular  0.5   (bodyText1)
/// body2        14.0  regular  0.25  (bodyText2)
/// button       14.0  medium   1.25
/// caption      12.0  regular  0.4
/// overline     10.0  regular  1.5
