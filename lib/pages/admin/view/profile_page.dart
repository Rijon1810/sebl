import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:SEBL_MYLoan/colors.dart';
import 'package:SEBL_MYLoan/pages/admin/controller/admin_controller.dart';

class ProfilePage extends StatelessWidget {
  final controller = Get.put(AdminController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My profile',
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
            Container(
              height: 30,
              width: 250,
              decoration: BoxDecoration(
                  color: CustomColors.bottomSheetBG,
                  borderRadius: BorderRadius.circular(10)),
              child: const Center(
                  child: Text(
                'Name',
                style: TextStyle(
                    fontFamily: 'Poppins', fontSize: 15, color: Colors.white),
              )),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  controller.currentUser.name.toString(),
                  style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 30,
              width: 250,
              decoration: BoxDecoration(
                  color: CustomColors.bottomSheetBG,
                  borderRadius: BorderRadius.circular(10)),
              child: const Center(
                  child: Text(
                'Email',
                style: TextStyle(
                    fontFamily: 'Poppins', fontSize: 15, color: Colors.white),
              )),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  controller.currentUser.email.toString(),
                  style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 30,
              width: 250,
              decoration: BoxDecoration(
                  color: CustomColors.bottomSheetBG,
                  borderRadius: BorderRadius.circular(10)),
              child: const Center(
                  child: Text(
                'Phone',
                style: TextStyle(
                    fontFamily: 'Poppins', fontSize: 15, color: Colors.white),
              )),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  controller.currentUser.phone.toString(),
                  style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 30,
              width: 250,
              decoration: BoxDecoration(
                  color: CustomColors.bottomSheetBG,
                  borderRadius: BorderRadius.circular(10)),
              child: const Center(
                  child: Text(
                'Address',
                style: TextStyle(
                    fontFamily: 'Poppins', fontSize: 15, color: Colors.white),
              )),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  controller.currentUser.address.toString(),
                  style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
