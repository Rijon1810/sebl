import 'package:flutter/material.dart';
import 'package:SEBL_MYLoan/colors.dart';
import 'package:SEBL_MYLoan/pages/admin/controller/admin_controller.dart';
import 'package:SEBL_MYLoan/routes.dart';
import 'package:get/get.dart';

class AdminHomePage extends StatelessWidget {
  final controller = Get.put(AdminController());
  Widget commonContainer(String textValue) {
    return Container(
      height: 100,
      width: 150,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.6),
            spreadRadius: 3,
            blurRadius: 6,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Center(
        child: Text(
          textValue,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontFamily: 'Poppins',
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.bgColor,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                height: 100,
                width: double.infinity,
                decoration:
                    const BoxDecoration(color: CustomColors.bottomSheetBG),
                child: Center(
                  child: Container(
                    margin: const EdgeInsets.only(top: 25),
                    child: const Text(
                      'Admin Module',
                      style: TextStyle(
                          fontSize: 22,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                      onTap: () {
                        Get.toNamed(RoutesPath.addMemberPage);
                      },
                      child: commonContainer('Add New Member')),
                  GestureDetector(
                      onTap: () {
                        Get.toNamed(RoutesPath.adminUserListPage);
                      },
                      child: commonContainer('Member List')),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                      onTap: () {
                        Get.toNamed(RoutesPath.collectChargePage);
                      },
                      child: commonContainer('Collect Charge')),
                  GestureDetector(
                      onTap: () {
                        Get.toNamed(RoutesPath.memberChargeListPage);
                      },
                      child: commonContainer('Charge List')),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                      onTap: () {
                        Get.toNamed(RoutesPath.requestLoan);
                      },
                      child: commonContainer('New Transaction')),
                  GestureDetector(
                      onTap: () {
                        Get.toNamed(RoutesPath.transactionList);
                      },
                      child: commonContainer('Transaction List')),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 80),
                child: ElevatedButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text(('Logging out')),
                              content: Text(('Are you sure?')),
                              actions: <Widget>[
                                TextButton(
                                  child: Text(
                                    ('No'),
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  onPressed: () => Navigator.pop(context),
                                ),
                                TextButton(
                                    child: Text(
                                      ('Yes'),
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    onPressed: () {
                                      Get.back();
                                      controller.signOut();
                                    })
                              ],
                            );
                          });
                    },
                    child: Container(
                      width: 100,
                      height: 50,
                      child: Center(child: Text('Logout')),
                    )),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Column(
                  children: [
                    Text(
                      'Developed By Rijon | 01708562437',
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins',
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
