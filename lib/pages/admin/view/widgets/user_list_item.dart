import 'package:flutter/material.dart';
import 'package:SEBL_MYLoan/pages/admin/model/user_list_model.dart';

class UserListItem extends StatelessWidget {
  final UserListData userListItem;
  const UserListItem({Key? key, required this.userListItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 5),
                renderRow('Name', userListItem.name.toString()),
                renderRow('Email', userListItem.email.toString()),
                renderRow('Phone', userListItem.phone.toString()),
                renderRow('Admin', userListItem.isAdmin.toString()),
                renderColumn('Address', userListItem.address.toString()),
                const SizedBox(height: 5)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget renderRow(String title, String value) {
    return Row(
      children: [
        Text(
          title + " : ",
          style:
              const TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          maxLines: 2,
        ),
        Container(width: 300, child: Text(getProperText(value))),
      ],
    );
  }

  Widget renderColumn(String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title + " : ",
          style:
              const TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          maxLines: 2,
        ),
        Text(getProperText(value)),
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
