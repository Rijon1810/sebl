import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:SEBL_MYLoan/colors.dart';
import 'package:SEBL_MYLoan/pages/admin/controller/admin_controller.dart';
import 'package:SEBL_MYLoan/widgets/progress_dialog.dart';
import 'package:get/get.dart';

class UpdateProfile extends StatefulWidget {
  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  final controller = Get.put(AdminController());

  final phoneTextController = TextEditingController();

  final nameTextController = TextEditingController();

  final passwordTextController = TextEditingController();

  final emailTextController = TextEditingController();

  final addressTextController = TextEditingController();

  bool btnColorActive = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    setState(() {
      phoneTextController.text = controller.currentUser.phone.toString();
      nameTextController.text = controller.currentUser.name.toString();
      emailTextController.text = controller.currentUser.email.toString();
      addressTextController.text = controller.currentUser.address.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Profile'),
        backgroundColor: CustomColors.bottomSheetBG,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: nameTextController,
                maxLines: 1,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyText1,
                keyboardType: TextInputType.text,
                onChanged: (value) {},
                decoration: InputDecoration(
                  label: const Text('Full Name**'),
                  isDense: true,
                  hintText: 'Your name...',
                  hintStyle: Theme.of(context)
                      .textTheme
                      .caption!
                      .copyWith(color: Colors.black45, fontSize: 14),
                  fillColor: Colors.grey[50],
                  filled: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
            ),
/*            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: phoneTextController,
                maxLines: 1,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyText1,
                keyboardType: TextInputType.number,
                onChanged: (value) {},
                decoration: InputDecoration(
                  label: const Text('Phone**'),
                  isDense: true,
                  hintText: '01xxxxxxxx',
                  hintStyle: Theme.of(context)
                      .textTheme
                      .caption!
                      .copyWith(color: Colors.black45, fontSize: 14),
                  fillColor: Colors.grey[50],
                  filled: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
            ),*/
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: emailTextController,
                maxLines: 1,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyText1,
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) {},
                decoration: InputDecoration(
                  label: const Text('Email'),
                  isDense: true,
                  hintText: 'abc@gmail.com',
                  hintStyle: Theme.of(context)
                      .textTheme
                      .caption!
                      .copyWith(color: Colors.black45, fontSize: 14),
                  fillColor: Colors.grey[50],
                  filled: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: addressTextController,
                maxLines: 3,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyText1,
                keyboardType: TextInputType.text,
                onChanged: (value) {},
                decoration: InputDecoration(
                  label: const Text('Address**'),
                  isDense: true,
                  hintText: 'Uttara, Dhaka',
                  hintStyle: Theme.of(context)
                      .textTheme
                      .caption!
                      .copyWith(color: Colors.black45, fontSize: 14),
                  fillColor: Colors.grey[50],
                  filled: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
            ),
            Obx(() {
              return TextFormField(
                textAlign: TextAlign.center,
                controller: passwordTextController,
                style: Theme.of(context).textTheme.bodyText1,
                keyboardType: TextInputType.text,
                obscureText: controller.hidePassword.value,
                onChanged: (value) {},
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
                      ? 'New Password**'
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
            GestureDetector(
              onTap: () {
                if (btnColorActive) {
                  String name = nameTextController.text;
                  String phone = phoneTextController.text;
                  String address = addressTextController.text;
                  String password = passwordTextController.text;
                  String email = emailTextController.text;
                  controller.params.clear();
                  controller.params['name'] = name;
                  /* controller.params['phone'] = phone;*/
                  controller.params['address'] = address;
                  controller.params['email'] = email;
                  if (password.isNotEmpty) {
                    controller.params['password'] = password;
                  }

                  controller.updateProfile();
                  ProgressDialog.show(Get.context!, "Processing..");
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
                          color: btnColorActive
                              ? CustomColors.bottomSheetBG
                              : Colors.black12,
                          border: Border.all(
                            width: 1,
                            color: btnColorActive
                                ? CustomColors.bottomSheetBG
                                : Colors.black12,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'Submit',
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
          ],
        ),
      ),
    );
  }
}
