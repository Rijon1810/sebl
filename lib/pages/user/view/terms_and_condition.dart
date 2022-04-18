import 'package:SEBL_MYLoan/colors.dart';
import 'package:flutter/material.dart';

class TermsAndCondition extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: CustomColors.bottomSheetBG,
        title: Text('Terms and Condition',
            style: TextStyle(fontFamily: 'Poppins')),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Icon(Icons.arrow_forward),
              Text(
                '  Income : Salary Minimum 20k-25k.',
                style: TextStyle(
                    fontFamily: 'Poppins', fontWeight: FontWeight.bold),
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Icon(Icons.arrow_forward),
              Text(
                '  Age Limit : Minimum 23 to Maximum 62.',
                style: TextStyle(
                    fontFamily: 'Poppins', fontWeight: FontWeight.bold),
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Icon(Icons.arrow_forward),
              Text(
                '  Nationality : Bangladeshi',
                style: TextStyle(
                    fontFamily: 'Poppins', fontWeight: FontWeight.bold),
              )
            ],
          ),
        ],
      ),
    );
  }
}
