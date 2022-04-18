import 'package:flutter/material.dart';
import 'package:SEBL_MYLoan/colors.dart';


class CustomTheme with ChangeNotifier {
  static bool _isDarkTheme = true;

  ThemeMode get currentTheme => _isDarkTheme ? ThemeMode.dark : ThemeMode.light;

  void toggleTheme() {
    _isDarkTheme = !_isDarkTheme;
    notifyListeners();
  }

  static ThemeData get lightTheme {
    //1
    return ThemeData(
        //2
        primaryColor: CustomColors.greenColor,
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Nunito',
        textTheme: const TextTheme(
          headline1: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.w500,
              color: TextLightThemeColors.mainColor),
          headline2: TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.w500,
              color: TextLightThemeColors.mainColor),
          headline3: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w500,
              color: TextLightThemeColors.appColor),
          headline4: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w600,
              color: TextLightThemeColors.mainColor),
          headline5: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w400,
              color: TextLightThemeColors.mainColor),
          headline6: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.w400,
              color: TextLightThemeColors.mainColor),
          bodyText1: TextStyle(
              fontSize: 14.0,
              color: TextLightThemeColors.mainColor,
              fontWeight: FontWeight.w400),
          bodyText2: TextStyle(
              fontSize: 12.0,
              color: TextLightThemeColors.mainColor,
              fontWeight: FontWeight.w400),
          subtitle1: TextStyle(
              fontSize: 12.0,
              fontWeight: FontWeight.w500,
              color: TextLightThemeColors.appColor),
          subtitle2: TextStyle(
              fontSize: 11.0,
              fontWeight: FontWeight.w500,
              color: TextLightThemeColors.mainColor),
          caption: TextStyle(
              fontSize: 10.0,
              fontWeight: FontWeight.w500,
              color: TextLightThemeColors.mainColor),
        ),
        buttonTheme: ButtonThemeData(
          // 4
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
          buttonColor: CustomColors.lightPurple,
        ));
  }

  static ThemeData get darkTheme {
    return ThemeData(
        primaryColor: CustomColors.darkGrey,
        scaffoldBackgroundColor: CustomColors.darkGrey,
        fontFamily: 'Nunito',
        textTheme: const TextTheme(
          headline1: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.w500,
              color: TextDarkThemeColors.mainColor),
          headline2: TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.w500,
              color: TextDarkThemeColors.mainColor),
          headline3: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w500,
              color: TextDarkThemeColors.appColor),
          headline4: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w600,
              color: TextDarkThemeColors.mainColor),
          headline5: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w400,
              color: TextDarkThemeColors.mainColor),
          headline6: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.w400,
              color: TextDarkThemeColors.mainColor),
          bodyText1: TextStyle(
              fontSize: 14.0,
              color: TextDarkThemeColors.mainColor,
              fontWeight: FontWeight.w400),
          bodyText2: TextStyle(
              fontSize: 12.0,
              color: TextDarkThemeColors.mainColor,
              fontWeight: FontWeight.w400),
          subtitle1: TextStyle(
              fontSize: 12.0,
              fontWeight: FontWeight.w500,
              color: TextDarkThemeColors.appColor),
          subtitle2: TextStyle(
              fontSize: 11.0,
              fontWeight: FontWeight.w500,
              color: TextDarkThemeColors.mainColor),
          caption: TextStyle(
              fontSize: 10.0,
              fontWeight: FontWeight.w500,
              color: TextDarkThemeColors.mainColor),
        ),
        buttonTheme: ButtonThemeData(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
          buttonColor: CustomColors.lightPurple,
        ));
  }
}
