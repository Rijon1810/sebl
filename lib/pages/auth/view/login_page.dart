import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:SEBL_MYLoan/colors.dart';
import 'package:SEBL_MYLoan/routes.dart';
import 'package:SEBL_MYLoan/widgets/progress_dialog.dart';
import 'package:get/get.dart';
import 'package:SEBL_MYLoan/pages/auth/controller/auth_controller.dart';

class LoginPage extends StatelessWidget {
  final controller = Get.put(AuthController());

  final phoneTextController = TextEditingController();
  final passwordTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 150,
              ),
              const Center(
                child: Image(
                    image: AssetImage('assets/images/playstore.png'),
                    width: 150,
                    fit: BoxFit.fitWidth),
              ),
              const SizedBox(
                height: 80,
              ),
              TextFormField(
                textAlign: TextAlign.center,
                controller: phoneTextController,
                style: Theme.of(context).textTheme.bodyText1,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  isDense: true,
                  prefixIcon: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.0),
                    child: Icon(
                      Icons.phone,
                      color: CustomColors.bottomSheetBG,
                    ),
                  ),
                  hintText: 'Phone',
                  hintStyle: Theme.of(context)
                      .textTheme
                      .caption!
                      .copyWith(color: Colors.black45, fontSize: 14),
                  fillColor: Colors.grey[50],
                  filled: true,
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(100)),
                  suffixIcon: const Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
                    child: SizedBox.shrink(),
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Obx(() {
                return TextFormField(
                  textAlign: TextAlign.center,
                  controller: passwordTextController,
                  style: Theme.of(context).textTheme.bodyText1,
                  keyboardType: TextInputType.text,
                  obscureText: controller.hidePassword.value,
                  decoration: InputDecoration(
                    isDense: true,
                    prefixIcon: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.0),
                      child: Icon(
                        Icons.lock,
                        color: CustomColors.bottomSheetBG,
                      ),
                    ),
                    hintText: controller.isForgotPassword.value == false
                        ? 'Password'
                        : 'New Password',
                    hintStyle: Theme.of(context)
                        .textTheme
                        .caption!
                        .copyWith(color: Colors.black45, fontSize: 14),
                    fillColor: Colors.grey[50],
                    filled: true,
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {
                        controller.hidePassword.value =
                            !controller.hidePassword.value;
                      },
                      color: Theme.of(context).focusColor,
                      icon: Icon(
                        controller.hidePassword.value
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: CustomColors.bottomSheetBG,
                      ),
                    ),
                  ),
                );
              }),
              SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () {
                  String phone = phoneTextController.text;
                  String password = passwordTextController.text;
                  if (phone != '' && password != '') {
                    controller.params.clear();
                    controller.params['phone'] = phone;
                    controller.params['password'] = password;
                    ProgressDialog.show(Get.context!, "Processing..");
                    controller.login();
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: CustomColors.bottomSheetBG,
                            border: Border.all(
                              width: 1,
                              color: CustomColors.bottomSheetBG,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              'Login',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(''),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(RoutesPath.addMemberPage);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'register',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                            color: CustomColors.bottomSheetBG),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
