import 'package:SEBL_MYLoan/data/api.dart';
import 'package:SEBL_MYLoan/routes.dart';
import 'package:get/get.dart';
import 'package:SEBL_MYLoan/authentication/authentication_controller.dart';
import 'package:SEBL_MYLoan/authentication/authentication_state.dart';

class AuthController extends GetxController {
  late AuthenticationController authenticationController;
  Map<String, dynamic> params = new Map<String, dynamic>();
  var hidePassword = true.obs;
  var isForgotPassword = false.obs;

  @override
  void onInit() {
    super.onInit();
    authenticationController = Get.find();
  }

  void login() async {
    var result = await api.loginApi(params);
    Get.back();
    if (result.token != null) {
      authenticationController.state = Authenticated(user: result);
      if (result.isAdmin == true) {
        Get.toNamed(RoutesPath.adminHomePage);
      } else {
        Get.toNamed(RoutesPath.userHomePage);
      }
      Get.snackbar('Success', 'Login Success',
          snackPosition: SnackPosition.BOTTOM);
    } else {
      Get.snackbar('Error', 'Login failed',
          snackPosition: SnackPosition.BOTTOM);
    }
  }
}
