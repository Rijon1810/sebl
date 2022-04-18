import 'package:flutter/material.dart';
import 'package:SEBL_MYLoan/pages/admin/controller/admin_controller.dart';
import 'package:SEBL_MYLoan/pages/admin/view/widgets/user_list_item.dart';
import 'package:get/get.dart';

class UsersListPage extends StatelessWidget {
  final controller = Get.put(AdminController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Members'),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Obx(() {
              return RefreshIndicator(
                onRefresh: _refreshUserList,
                child: ListView.builder(
                  physics: BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics()),
                  itemBuilder: (context, index) {
                    return UserListItem(
                      userListItem: controller.userList.elementAt(index),
                    );
                  },
                  itemCount: controller.userList.length,
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
    controller.getAllUser();
  }
}
