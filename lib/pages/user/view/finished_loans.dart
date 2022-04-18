import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:SEBL_MYLoan/colors.dart';
import 'package:SEBL_MYLoan/pages/admin/controller/admin_controller.dart';
import 'package:SEBL_MYLoan/pages/admin/view/widgets/transaction_item.dart';

class FinishedLoans extends StatelessWidget {
  final controller = Get.put(AdminController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.bottomSheetBG,
        title: Text('Finished Loans'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Obx(() {
              if (controller.transactionListFinish.isEmpty) {
                return Center(
                  child: Container(
                    height: 50,
                    width: 150,
                    margin: EdgeInsets.only(top: 200),
                    decoration: BoxDecoration(
                      color: CustomColors.bottomSheetBG,
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Center(
                      child: Text(
                        'No data found',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontFamily: 'Poppins' , color: Colors.white),
                      ),
                    ),
                  ),
                );
              }
              return RefreshIndicator(
                onRefresh: _refreshList,
                child: ListView.builder(
                  physics: BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics()),
                  itemBuilder: (context, index) {
                    return TransactionListItem(
                      listItem:
                          controller.transactionListFinish.elementAt(index),
                    );
                  },
                  itemCount: controller.transactionListFinish.length,
                  primary: false,
                  shrinkWrap: true,
                ),
              );
            })
          ],
        ),
      ),
    );
  }

  Future<Null> _refreshList() async {
    print('refreshing stocks...');
    controller.getAllTransactions();
  }
}
