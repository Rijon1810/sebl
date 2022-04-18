import 'package:flutter/material.dart';
import 'package:SEBL_MYLoan/colors.dart';
import 'package:SEBL_MYLoan/pages/admin/controller/admin_controller.dart';
import 'package:SEBL_MYLoan/pages/admin/view/widgets/transaction_item.dart';
import 'package:get/get.dart';

class TransactionList extends StatefulWidget {
  @override
  _TransactionListState createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {
  final controller = Get.put(AdminController());
  Widget allTransactionWidget() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Obx(() {
            if (controller.transactionList.isEmpty) {
              return Center(
                child: Container(
                  height: 50,
                  width: 150,
                  margin: EdgeInsets.only(top: 200),
                  decoration: BoxDecoration(
                      color: CustomColors.bottomSheetBG,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Text(
                      'No data found',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins',
                          color: Colors.white),
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
                    listItem: controller.transactionList.elementAt(index),
                  );
                },
                itemCount: controller.transactionList.length,
                primary: false,
                shrinkWrap: true,
              ),
            );
          })
        ],
      ),
    );
  }

  Widget incomeTransactionWidget() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Obx(() {
            if (controller.transactionListIncome.isEmpty) {
              return Center(
                child: Container(
                  height: 50,
                  width: 150,
                  margin: EdgeInsets.only(top: 200),
                  decoration: BoxDecoration(
                      color: CustomColors.bottomSheetBG,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Text(
                      'No data found',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins',
                          color: Colors.white),
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
                    listItem: controller.transactionListIncome.elementAt(index),
                  );
                },
                itemCount: controller.transactionListIncome.length,
                primary: false,
                shrinkWrap: true,
              ),
            );
          })
        ],
      ),
    );
  }

  Widget expenseTransactionWidget() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Obx(() {
            if (controller.transactionListExpense.isEmpty) {
              return Center(
                child: Container(
                  height: 50,
                  width: 150,
                  margin: EdgeInsets.only(top: 200),
                  decoration: BoxDecoration(
                      color: CustomColors.bottomSheetBG,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Text(
                      'No data found',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins',
                          color: Colors.white),
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
                        controller.transactionListExpense.elementAt(index),
                  );
                },
                itemCount: controller.transactionListExpense.length,
                primary: false,
                shrinkWrap: true,
              ),
            );
          })
        ],
      ),
    );
  }

  Widget finishTransactionWidget() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Text(
                      'No data found',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins',
                          color: Colors.white),
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
                    listItem: controller.transactionListFinish.elementAt(index),
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: CustomColors.bottomSheetBG,
            centerTitle: true,
            bottom: const TabBar(
              indicatorColor: Colors.black,
              tabs: [
                Tab(
                  child: Text('My loans'),
                ),
                Tab(
                  child: Text('Request Loans'),
                ),
                Tab(
                  child: Text('Running Loans'),
                ),
/*                Tab(
                  child: Text('Finish Loans'),
                ),*/
              ],
            ),
            title: const Text('Loans'),
          ),
          body: TabBarView(
            children: [
              allTransactionWidget(),
              expenseTransactionWidget(),
              incomeTransactionWidget(),
           /*   finishTransactionWidget()*/
            ],
          ),
        ),
      ),
    );
  }

  Future<Null> _refreshList() async {
    print('refreshing stocks...');
    controller.getAllTransactions();
  }
}
