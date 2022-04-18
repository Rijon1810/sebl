import 'package:flutter/material.dart';
import 'package:SEBL_MYLoan/pages/admin/model/membe_charge_list_model.dart';
import 'package:SEBL_MYLoan/pages/admin/model/transaction_list_model.dart';
import 'package:SEBL_MYLoan/pages/admin/model/user_list_model.dart';
import 'package:intl/intl.dart';

class TransactionListItem extends StatelessWidget {
  final TransactionListData listItem;
  const TransactionListItem({Key? key, required this.listItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              children: [
                const SizedBox(height: 5),
                renderRow('Name', listItem.name.toString()),
                renderRow('Address', listItem.address.toString()),
                renderRow('Phone', listItem.phone.toString()),
                renderRow('Age', listItem.age.toString()),
                renderRow('NID/Passport', listItem.nid.toString()),
                renderRow('Loan Type', listItem.loanType.toString()),
                listItem.loanType.toString() == 'Car Loan'
                    ? SizedBox()
                    : renderRow('Purpose', listItem.purpose.toString()),
                renderRow('Salary', listItem.salary.toString()),
                renderRow('Loan Time', listItem.loanTime.toString()),
                renderRow('Active', listItem.active == true ? "Yes" : "No"),
                renderRow(
                    'Transaction-ID', listItem.transactionNumber.toString()),
                renderRow('Amount', listItem.amount.toString() + '৳'),
                renderRow('Date', dates(listItem.transactionAt.toString())),
                const SizedBox(height: 5)
              ],
            ),
          ),
        ),
      ),
    );
  }

  String dates(String s) {
    if (s == 'null') {
      return 'N/A';
    }
    DateTime end = DateTime.parse(s.substring(0, s.length - 1));
    DateTime tempDate = DateFormat("hh:mm")
        .parse(end.hour.toString() + ":" + end.minute.toString());
    var dateFormat = DateFormat("h:mm a"); // you can change the format here
/*    print(dateFormat.format(tempDate));*/
    String Final = end.day.toString() +
        ' ' +
        month(end.month.toString()) +
        ' ' +
        end.year.toString() +
        ' - ' +
        dateFormat.format(tempDate).toString();
    return Final;
  }

  String month(String m) {
    if (m == '1')
      return 'Jan';
    else if (m == '2')
      return 'Feb';
    else if (m == '3')
      return 'Mar';
    else if (m == '4')
      return 'Apr';
    else if (m == '5')
      return 'May';
    else if (m == '6')
      return 'Jun';
    else if (m == '7')
      return 'Jul';
    else if (m == '8')
      return 'Aug';
    else if (m == '9')
      return 'Sept';
    else if (m == '10')
      return 'Oct';
    else if (m == '11')
      return 'Nov';
    else
      return 'Dec';
  }

  Widget renderRow(String title, String value) {
    return Row(
      children: [
        Row(
          children: [
            Text(
              title + " : ",
              style: const TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.black),
              maxLines: 2,
            ),
            Text(getProperText(value)),
          ],
        ),
      ],
    );
  }

  String getProperText(text) {
    if (text == 'null') {
      return 'N/A';
    }
    return text;
  }
}
