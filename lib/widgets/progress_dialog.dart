import 'package:flutter/material.dart';

class ProgressDialog {
  static show(BuildContext context, String title) {
    try {
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) {
            return WillPopScope(
              onWillPop: () async {
                return false;
              },
              child: AlertDialog(
                content: Flex(
                  direction: Axis.horizontal,
                  children: <Widget>[
                    const CircularProgressIndicator(),
                    const Padding(
                      padding: EdgeInsets.only(left: 15),
                    ),
                    Flexible(
                        flex: 8,
                        child: Text(
                          title,
                          style: Theme.of(context).textTheme.bodyText1,
                        )),
                  ],
                ),
              ),
            );
          });
    } catch (e) {
      print(e.toString());
    }
  }
}
