import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:SEBL_MYLoan/colors.dart';
import 'package:SEBL_MYLoan/pages/admin/controller/admin_controller.dart';
import 'package:SEBL_MYLoan/widgets/progress_dialog.dart';
import 'package:get/get.dart';

class LoanCalculator extends StatefulWidget {
  @override
  State<LoanCalculator> createState() => _LoanCalculatorState();
}

class _LoanCalculatorState extends State<LoanCalculator> {
  final controller = Get.put(AdminController());

  final amountTextController = TextEditingController();

  final rateTextController = TextEditingController();

  final monthController = TextEditingController();

  double emi = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Loan Calculator'),
        backgroundColor: CustomColors.bottomSheetBG,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: amountTextController,
                maxLines: 1,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyText1,
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  returnEMI();
                },
                decoration: InputDecoration(
                  label: const Text('Amount**'),
                  isDense: true,
                  hintText: '1500৳',
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
                controller: rateTextController,
                maxLines: 1,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyText1,
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  returnEMI();
                },
                decoration: InputDecoration(
                  label: const Text('Interest Rate**'),
                  isDense: true,
                  hintText: '8%',
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
                controller: monthController,
                maxLines: 1,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyText1,
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  returnEMI();
                },
                decoration: InputDecoration(
                  label: const Text('Months to Pay**'),
                  isDense: true,
                  hintText: '10',
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
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      monthController.text = "";
                      amountTextController.text = "";
                      rateTextController.text = "";
                      emi = 0.0;
                    });
                  },
                  child: Icon(
                    Icons.refresh,
                    size: 40,
                  ),
                ),
                Container(
                  height: 30,
                  width: 250,
                  decoration: BoxDecoration(
                      color: CustomColors.bottomSheetBG,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                      child: Text(
                    emi.toString() + '৳',
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 15,
                        color: Colors.white),
                  )),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  returnEMI() {
    double amount = double.parse(
        amountTextController.text.isNotEmpty ? amountTextController.text : "0");
    double months = double.parse(
        monthController.text.isNotEmpty ? monthController.text : "0");
    double rate = double.parse(
        rateTextController.text.isNotEmpty ? rateTextController.text : "0");
    double interest = (amount * (rate * 0.01)) / months;
    double total = ((amount / months) + interest);
    if (total >= 0) {
      setState(() {
        emi = total.toPrecision(2);
      });
    } else {
      setState(() {
        emi = 0;
      });
    }
  }
}
