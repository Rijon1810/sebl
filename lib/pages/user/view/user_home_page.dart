import 'package:flutter/material.dart';
import 'package:SEBL_MYLoan/colors.dart';
import 'package:SEBL_MYLoan/pages/admin/controller/admin_controller.dart';
import 'package:SEBL_MYLoan/routes.dart';
import 'package:get/get.dart';

class UserHomePage extends StatelessWidget {
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
      body: RefreshIndicator(
        onRefresh: _refresh,
        child: SingleChildScrollView(
          child: Container(
            child:Column(
              children: [
                Container(
                  height: 100,
                  width: double.infinity,
                  decoration:
                  const BoxDecoration(color: CustomColors.bottomSheetBG),
                  child: Center(
                    child: Container(
                      margin: const EdgeInsets.only(top: 25),
                      child: Text(
                        'Hello, ' + controller.currentUser.name.toString(),
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
                          Get.toNamed(RoutesPath.profilePage);
                        },
                        child: commonContainer('My profile')),
                    GestureDetector(
                        onTap: () {
                          Get.toNamed(RoutesPath.myAccount);
                        },
                        child: commonContainer('My accounts')),
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
                          Get.toNamed(RoutesPath.transactionList);
                        },
                        child: commonContainer('My Loans')),
                    GestureDetector(
                        onTap: () {
                          Get.toNamed(RoutesPath.locationPage);
                        },
                        child: commonContainer('Location')),
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
                          Get.toNamed(RoutesPath.updateProfile);
                        },
                        child: commonContainer('Settings')),
                    GestureDetector(
                        onTap: () {
                          Get.toNamed(RoutesPath.requestLoan);
                        },
                        child: commonContainer('Apply Loan')),
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
                          Get.toNamed(RoutesPath.finishedLoans);
                        },
                        child: commonContainer('Finished Loan')),
                    GestureDetector(
                        onTap: () {
                          Get.toNamed(RoutesPath.loanCalculator);
                        },
                        child: commonContainer('Loan Calculator')),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50.0, bottom: 20.0),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
  Future<Null> _refresh() async {
    print('refreshing stocks...');
    controller.getProfile();
  }
}
