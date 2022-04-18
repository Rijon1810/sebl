import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AppConstants {
  /// Enable for Test (uncomment Ctrl + / ) (comment Ctrl + Shift + /)
/*  static const IMAGE_BASE_URL =
      kReleaseMode ? 'http://192.168.1.104:5000' : 'http://192.168.1.104:5000';
  static const API_BASE_URL =
      kReleaseMode ? 'http://192.168.1.104:5000' : 'http://192.168.1.104:5000';*/

  static const IMAGE_BASE_URL = kReleaseMode
      ? 'https://sebl.herokuapp.com'
      : 'https://sebl.herokuapp.com';
  static const API_BASE_URL = kReleaseMode
      ? 'https://sebl.herokuapp.com'
      : 'https://sebl.herokuapp.com';
  // static const appID = 'c903ae36c3634edf94dbdd2b986f2ab9';
  static const DEVICE_TYPE_PHONE = 'phone';
  static const DEVICE_TYPE_TABLET = 'tablet';
  static String getDeviceType() {
    final data = MediaQueryData.fromWindow(WidgetsBinding.instance!.window);
    return data.size.shortestSide < 600
        ? DEVICE_TYPE_PHONE
        : DEVICE_TYPE_TABLET;
  }

  ///User Type
  static const USER_TYPE_STUDENT = "student";
  static const USER_TYPE_TEACHER = "teacher";
  static const USER_TYPE_MANAGER = "manager";
  static const USER_TYPE_OWNER = "owner";
  static String removeDecimalZeroFormat(double v) {
    NumberFormat formatter = NumberFormat();
    formatter.minimumFractionDigits = 0;
    formatter.maximumFractionDigits = 2;
    return formatter.format(v);
  }

  static void printLog(dynamic content) {
    print(
        '----------------------------------------------------------------------------');
    print('| $content ');
    print(
        '----------------------------------------------------------------------------');
  }
}
