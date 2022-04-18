import 'package:flutter/material.dart';
import 'package:SEBL_MYLoan/pages/admin/view/admin_home_page.dart';
import 'package:SEBL_MYLoan/pages/auth/model/login_model.dart';
import 'package:SEBL_MYLoan/pages/user/view/user_home_page.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:SEBL_MYLoan/authentication/authentication_controller.dart';
import 'package:SEBL_MYLoan/authentication/authentication_service.dart';
import 'package:SEBL_MYLoan/authentication/authentication_state.dart';
import 'package:SEBL_MYLoan/pages/auth/view/login_page.dart';
import 'package:SEBL_MYLoan/pages/important/splash.dart';
import 'package:SEBL_MYLoan/routes_path.dart';
import 'package:SEBL_MYLoan/theme/style.dart';

void main() async {
  await GetStorage.init();
  await GetStorage.init("Auth");
  runApp(Main());
}

void initialize() {
  Get.lazyPut(
    () => AuthenticationController(
        Get.put(UserAuthenticationService(), permanent: true)),
  );
}

class Main extends StatefulWidget {
  @override
  _MainState createState() => _MainState();
}

final AuthenticationController controller = Get.put(
  AuthenticationController(
      Get.put(UserAuthenticationService(), permanent: true)),
);

class _MainState extends State<Main> {
  @override
  Widget build(BuildContext context) {
    late LoginModel currentUser;
    return GetMaterialApp(
      title: 'SEBL',
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      home: Obx(() {
        if (controller.state is UnAuthenticated) {
          return LoginPage();
        }
        if (controller.state is Authenticated) {
          currentUser = currentUser = (controller.state as Authenticated).user;
          print(currentUser.toJson());
          if (currentUser.isAdmin == true) {
            return AdminHomePage();
          } else {
            return UserHomePage();
          }
          //user: (controller.state as Authenticated).user,
        }
        return SplashPage();
      }),
      getPages: Routes.routes,
    );
  }
}
