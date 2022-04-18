import 'package:SEBL_MYLoan/colors.dart';
import 'package:SEBL_MYLoan/pages/admin/controller/admin_controller.dart';
import 'package:SEBL_MYLoan/routes.dart';
import 'package:SEBL_MYLoan/widgets/progress_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CarLoan extends StatefulWidget {
  @override
  State<CarLoan> createState() => _CarLoanState();
}

class _CarLoanState extends State<CarLoan> {
  final controller = Get.put(AdminController());
  final nameController = TextEditingController();
  final salaryController = TextEditingController();
  final loanTimeController = TextEditingController();
  final ageController = TextEditingController();
  final addressController = TextEditingController();
  final phoneController = TextEditingController();
  final nidOrPassportController = TextEditingController();
  final amountTextController = TextEditingController();
  List<String> purPose = [
    'New',
    'Recondition',
  ];
  String? purpose;
  bool btnColorActive = false;
  bool acceptTermsAndCondition = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.bottomSheetBG,
        title: Text('Car Loan'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: nameController,
                maxLines: 1,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyText1,
                keyboardType: TextInputType.text,
                onChanged: (value) {
                  if (value != "") {
                    setState(() {
                      btnColorActive = handleBtnActive();
                    });
                  } else {
                    setState(() {
                      btnColorActive = false;
                    });
                  }
                },
                decoration: InputDecoration(
                  label: const Text('Name**'),
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: ageController,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyText1,
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  if (value != "") {
                    setState(() {
                      btnColorActive = handleBtnActive();
                    });
                  } else {
                    setState(() {
                      btnColorActive = false;
                    });
                  }
                },
                decoration: InputDecoration(
                  label: const Text('Age**'),
                  isDense: true,
                  hintText: '25 (23 t0 65 year)',
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
                controller: addressController,
                maxLines: 3,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyText1,
                keyboardType: TextInputType.text,
                onChanged: (value) {
                  if (value != "") {
                    setState(() {
                      btnColorActive = handleBtnActive();
                    });
                  } else {
                    setState(() {
                      btnColorActive = false;
                    });
                  }
                },
                decoration: InputDecoration(
                  label: const Text('Address**'),
                  isDense: true,
                  hintText: 'Your address...',
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
                controller: phoneController,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyText1,
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  if (value != "") {
                    setState(() {
                      btnColorActive = handleBtnActive();
                    });
                  } else {
                    setState(() {
                      btnColorActive = false;
                    });
                  }
                },
                decoration: InputDecoration(
                  label: const Text('Phone**'),
                  isDense: true,
                  hintText: '01xxxxxxxxx',
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
                controller: loanTimeController,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyText1,
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  if (value != "") {
                    setState(() {
                      btnColorActive = handleBtnActive();
                    });
                  } else {
                    setState(() {
                      btnColorActive = false;
                    });
                  }
                },
                decoration: InputDecoration(
                  label: const Text('Loan Time**'),
                  isDense: true,
                  hintText: '5 (1 to 7 year)',
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
            Container(
              //margin: EdgeInsets.symmetric(vertical: 8),
              child: Card(
                elevation: 2,
                child: Container(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
                  child: DropdownButtonFormField<String>(
                    dropdownColor: Theme.of(context).scaffoldBackgroundColor,
                    value: purpose,
                    style: Get.textTheme.bodyText1,
                    hint: Text(
                      "Care Type".tr,
                      style: Get.textTheme.bodyText1,
                    ),
                    onChanged: onChange,
                    validator: (String? value) {
                      if (value == null) {
                        return 'Select a car type..'.tr;
                      }
                    },
                    items:
                        purPose.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: amountTextController,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyText1,
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  if (value != "") {
                    setState(() {
                      btnColorActive = handleBtnActive();
                    });
                  } else {
                    setState(() {
                      btnColorActive = false;
                    });
                  }
                },
                decoration: InputDecoration(
                  label: const Text('Loan Amount**(5Lac-40Lac)'),
                  isDense: true,
                  hintText: '500000৳',
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
                controller: salaryController,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyText1,
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  if (value != "") {
                    setState(() {
                      btnColorActive = handleBtnActive();
                    });
                  } else {
                    setState(() {
                      btnColorActive = false;
                    });
                  }
                },
                decoration: InputDecoration(
                  label: const Text('Salary**(25k-30k)'),
                  isDense: true,
                  hintText: '26000৳',
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
                controller: nidOrPassportController,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyText1,
                keyboardType: TextInputType.text,
                onChanged: (value) {
                  if (value != "") {
                    setState(() {
                      btnColorActive = handleBtnActive();
                    });
                  } else {
                    setState(() {
                      btnColorActive = false;
                    });
                  }
                },
                decoration: InputDecoration(
                  label: const Text('NID/Passport No.**'),
                  isDense: true,
                  hintText: 'Nid-334xxxx/Pass-234xxxx',
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
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(RoutesPath.termsAndCondition);
                    },
                    child: const Text(
                      'Accept terms and conditions',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold,
                          color: CustomColors.bottomSheetBG,
                          decoration: TextDecoration.underline),
                    ),
                  ),
                  SizedBox(
                    width: 6,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        acceptTermsAndCondition = !acceptTermsAndCondition;
                        btnColorActive = handleBtnActive();
                      });
                    },
                    child: Icon(
                      acceptTermsAndCondition
                          ? Icons.check_box
                          : Icons.check_box_outline_blank,
                      color: CustomColors.bottomSheetBG,
                    ),
                  )
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                if (btnColorActive) {
                  String name = nameController.text;
                  String address = addressController.text;
                  String phone = phoneController.text;
                  String nid = nidOrPassportController.text;
                  int amount = double.parse(amountTextController.text).floor();
                  int salary = double.parse(salaryController.text).floor();
                  int loanTime = double.parse(loanTimeController.text).floor();
                  int age = double.parse(ageController.text).floor();
                  controller.params.clear();
                  controller.params['name'] = name;
                  controller.params['amount'] = amount;
                  controller.params['address'] = address;
                  controller.params['phone'] = phone;
                  controller.params['nid'] = nid;
                  controller.params['salary'] = salary;
                  controller.params['loanTime'] = loanTime;
                  controller.params['age'] = age;
                  controller.params['loanType'] = 'Car Loan';
                  controller.params['purpose'] = purpose;
                  controller.params['requestedBy'] =
                      controller.currentUser.id.toString();
                  controller.createNewTransaction();
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
                        child: const Center(
                          child: Text(
                            'Request',
                            style: TextStyle(
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

  void onChange(value) {
    setState(() {
      purpose = value;
    });
  }

  bool handleBtnActive() {
    String name = nameController.text;
    String address = addressController.text;
    String phone = phoneController.text;
    String nid = nidOrPassportController.text;
    int amount = double.parse(amountTextController.text).floor();
    int salary = double.parse(salaryController.text).floor();
    int loanTime = double.parse(loanTimeController.text).floor();
    int age = double.parse(ageController.text).floor();
    if (name.isNotEmpty &&
        amount >= 500000 &&
        amount <= 4000000 &&
        acceptTermsAndCondition == true &&
        address.isNotEmpty &&
        phone.length == 11 &&
        nid.isNotEmpty &&
        purpose!.isNotEmpty &&
        salary >= 25000 &&
        salary <= 30000 &&
        loanTime >= 1 &&
        loanTime <= 7 &&
        age >= 23 &&
        age <= 65) {
      return true;
    }
    return false;
  }
}
