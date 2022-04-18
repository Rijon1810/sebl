import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:SEBL_MYLoan/pages/auth/model/login_model.dart';

abstract class AuthenticationService extends GetxService {
  Future<LoginModel?> getCurrentUser();

  Future<void> signOut();
}

class UserAuthenticationService extends AuthenticationService {
  @override
  Future<LoginModel?> getCurrentUser() async {
    var currentUser = GetStorage("Auth").read('user');
    if (currentUser != null) {
      return LoginModel.fromJson(currentUser);
    }
    return null;
  }

  @override
  Future<void> signOut() async {
    try {
      GetStorage().erase();
      GetStorage("Auth").erase();
      debugPrint('StorageCleared');
    } catch (e) {
      e.printError(info: 'StorageCleared');
    }
  }
}

class AuthenticationException implements Exception {
  final String message;
  AuthenticationException({this.message = 'Unknown error occurred. '});
}
