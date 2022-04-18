import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:SEBL_MYLoan/colors.dart';
import 'package:SEBL_MYLoan/pages/admin/controller/admin_controller.dart';

class MyAccount extends StatelessWidget {
  final controller = Get.put(AdminController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Account',
          style: TextStyle(fontFamily: 'Poppins'),
        ),
        backgroundColor: CustomColors.bottomSheetBG,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Center(
              child: Container(
                height: 40,
                width: 300,
                decoration: BoxDecoration(
                    color: CustomColors.bottomSheetBG,
                    borderRadius: BorderRadius.circular(10)),
                child: const Center(
                    child: Text(
                  'Current Account',
                  style: TextStyle(
                      fontFamily: 'Poppins', fontSize: 18, color: Colors.white),
                )),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: Container(
                height: 40,
                width: 350,
                decoration: BoxDecoration(
                    color: CustomColors.bgColor,
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                    child: Text(
                  controller.currentUser.id.toString(),
                  style: TextStyle(
                      fontFamily: 'Poppins', fontSize: 18, color: Colors.black),
                )),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Center(
              child: Container(
                height: 40,
                width: 300,
                decoration: BoxDecoration(
                    color: CustomColors.bottomSheetBG,
                    borderRadius: BorderRadius.circular(10)),
                child: const Center(
                    child: Text(
                  'Savings (SB) Account',
                  style: TextStyle(
                      fontFamily: 'Poppins', fontSize: 20, color: Colors.white),
                )),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: Container(
                height: 40,
                width: 350,
                decoration: BoxDecoration(
                    color: CustomColors.bgColor,
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                    child: Text(
                      'SB'+controller.currentUser.id.toString()+'98',
                      style: TextStyle(
                          fontFamily: 'Poppins', fontSize: 18, color: Colors.black),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
