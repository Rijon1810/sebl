import 'package:flutter/material.dart';
import 'package:SEBL_MYLoan/pages/admin/controller/admin_controller.dart';
import 'package:SEBL_MYLoan/pages/admin/view/widgets/charge_list_item.dart';
import 'package:SEBL_MYLoan/pages/admin/view/widgets/user_list_item.dart';
import 'package:get/get.dart';

class MemberChargeListPage extends StatelessWidget {
  final controller = Get.put(AdminController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Charges'),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Obx(() {
              return RefreshIndicator(
                onRefresh: _refreshUserList,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics()),
                  itemBuilder: (context, index) {
                    return MemberChargeListItem(
                      chargeListItem:
                          controller.memberChargesList.elementAt(index),
                    );
                  },
                  itemCount: controller.memberChargesList.length,
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

  Future<Null> _refreshUserList() async {
    print('refreshing stocks...');
    controller.getAllMemberCharges();
  }
}
