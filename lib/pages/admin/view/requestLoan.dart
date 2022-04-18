import 'dart:math';

import 'package:SEBL_MYLoan/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:SEBL_MYLoan/colors.dart';
import 'package:SEBL_MYLoan/pages/admin/controller/admin_controller.dart';
import 'package:SEBL_MYLoan/widgets/progress_dialog.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class RequestLoan extends StatefulWidget {
  @override
  State<RequestLoan> createState() => _RequestLoanState();
}

class _RequestLoanState extends State<RequestLoan> {
  final controller = Get.put(AdminController());

  final amountTextController = TextEditingController();

  final titleTextController = TextEditingController();

  final detailsTextController = TextEditingController();

  bool btnColorActive = false;
  bool acceptTermsAndCondition = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Apply For Loan'),
        backgroundColor: CustomColors.bottomSheetBG,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.toNamed(RoutesPath.peronLoan);
                  },
                  child: Container(
                    height: 50,
                    width: 180,
                    decoration: BoxDecoration(
                        color: CustomColors.bottomSheetBG,
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: Text(
                        'Personal Loan',
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(RoutesPath.carLoan);
                  },
                  child: Container(
                    height: 50,
                    width: 180,
                    decoration: BoxDecoration(
                        color: CustomColors.bottomSheetBG,
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: Text(
                        'Car Loan',
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<Null> _refreshList() async {
    print('refreshing stocks...');
    controller.getAllTransactions();
  }

  void main() {
    runApp(
      MaterialApp(
          home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter is beautiful'),
        ),
        body: Center(
          child: RaisedButton(
            onPressed: _launchURL,
            child: Text('Show Flutter homepage'),
          ),
        ),
      )),
    );
  }

  _launchURL() async {
    const url =
        'https://ibanking.southeastbank.com.bd/ibankUltimus/IBU_USER_DOC/TermsAndConditions.pdf';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  bool handleBtnActive() {
    String title = titleTextController.text;
    int amount = double.parse(amountTextController.text).floor();
    if (title.isNotEmpty && amount >= 1 && acceptTermsAndCondition == true) {
      return true;
    }
    return false;
  }
}
