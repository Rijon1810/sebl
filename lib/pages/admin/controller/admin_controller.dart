import 'package:flutter/foundation.dart';
import 'package:SEBL_MYLoan/data/api.dart';
import 'package:SEBL_MYLoan/pages/admin/model/membe_charge_list_model.dart';
import 'package:SEBL_MYLoan/pages/admin/model/transaction_list_model.dart';
import 'package:SEBL_MYLoan/pages/admin/model/user_list_model.dart';
import 'package:SEBL_MYLoan/pages/auth/model/login_model.dart';
import 'package:SEBL_MYLoan/routes.dart';
import 'package:get/get.dart';
import 'package:SEBL_MYLoan/authentication/authentication_controller.dart';
import 'package:SEBL_MYLoan/authentication/authentication_state.dart';

class AdminController extends GetxController {
  late AuthenticationController authenticationController;
  Map<String, dynamic> params = new Map<String, dynamic>();
  UserListModel userListInfo = UserListModel();
  MemberChargeListModel memberChargesListInfo = MemberChargeListModel();
  RxList<UserListData> userList = <UserListData>[].obs;
  RxList<MemberChargeListData> memberChargesList = <MemberChargeListData>[].obs;
  RxList<MemberChargeListData> myChargesList = <MemberChargeListData>[].obs;
  RxList<TransactionListData> transactionList = <TransactionListData>[].obs;
  RxList<TransactionListData> transactionListExpense =
      <TransactionListData>[].obs;
  RxList<TransactionListData> transactionListIncome =
      <TransactionListData>[].obs;
  RxList<TransactionListData> transactionListFinish =
      <TransactionListData>[].obs;
  UserListData? selectedUser;
  var hidePassword = true.obs;
  var isForgotPassword = false.obs;
  late LoginModel currentUser;
  String chargeQuery = '';
  @override
  void onInit() {
    super.onInit();
    authenticationController = Get.find();
    initData();
  }

  void initData() {
    if (authenticationController.state is Authenticated) {
      currentUser = (authenticationController.state as Authenticated).user;
    }
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
/*    getAllUser();
    getAllMemberCharges();*/
    getAllTransactions();
    getProfile();
  }

  void updateProfile() async {
    var result = await api.updateApi(params);
    Get.back();
    if (result.token != null) {
      authenticationController.state = Authenticated(user: result);
      initData();
      if (result.isAdmin == true) {
        Get.toNamed(RoutesPath.adminHomePage);
      } else {
        Get.toNamed(RoutesPath.userHomePage);
      }
      Get.snackbar('Success', 'Update Profile Success',
          snackPosition: SnackPosition.BOTTOM);
    } else {
      Get.snackbar('Error', 'Update profile failed',
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  void getProfile() async {
    var result = await api.getProfileInfoApi();
    Get.back();
    if (result.token != null) {
      authenticationController.state = Authenticated(user: result);
      initData();
    } else {
    }
  }

  void register() async {
    var result = await api.registerApi(params);
    Get.back();
    if (result.id != null) {
      Get.back();
      Get.toNamed(RoutesPath.login);
      Get.snackbar('Success', 'User registration successful!',
          snackPosition: SnackPosition.BOTTOM);
    } else {
      Get.snackbar('Error', 'Register failed',
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  void signOut() async {
    //var result = await api.logoutApi();
    //Get.back();

    authenticationController.signOut();
    Get.toNamed(RoutesPath.login);
    Get.snackbar('Success', 'SignOut Successfully',
        snackPosition: SnackPosition.BOTTOM);
  }

  void createNewMemberCharge() async {
    var result = await api.createNewMemberChargeApi(params);
    Get.back();
    if (result.id != null) {
      Get.back();
      getAllMemberCharges();
      Get.toNamed(RoutesPath.memberChargeListPage);
      Get.snackbar('Success', 'Charge added',
          snackPosition: SnackPosition.BOTTOM);
    } else {
      Get.snackbar('Error', 'Charge add failed',
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  void createNewTransaction() async {
    var result = await api.createNewTransactionApi(params);
    Get.back();
    if (result.id != null) {
      Get.back();
      getAllTransactions();
      Get.toNamed(RoutesPath.transactionList);
      Get.snackbar('Success', 'Loan request',
          snackPosition: SnackPosition.BOTTOM);
    } else {
      Get.snackbar('Error', 'Loan creation failed',
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  void getAllUser() async {
    var result = await api.getAllUserApi();
    if (result != null) {
      userList.clear();
      userList.refresh();
      userList.addAll(result.data!.toList());
    }
  }

  void getAllMemberCharges() async {
    var result = await api.getAllMemberChargesApi();
    if (result != null) {
      memberChargesList.clear();
      myChargesList.clear();
      memberChargesList.refresh();
      myChargesList.refresh();
      memberChargesList.addAll(result.data!.toList());
      for (int i = 0; i < memberChargesList.length; i++) {
        if (memberChargesList.elementAt(i).user.toString() ==
            currentUser.id.toString()) {
          myChargesList.add(memberChargesList.elementAt(i));
        }
      }
      myChargesList.refresh();
    }
  }

  void getAllTransactions() async {
    String id = currentUser.id.toString();
    var result = await api.getAllTransactionsApi('?id=$id');
    if (result != null) {
      transactionList.clear();
      transactionListIncome.clear();
      transactionListExpense.clear();
      transactionListFinish.clear();
      transactionList.refresh();
      transactionListIncome.refresh();
      transactionListExpense.refresh();
      transactionList.addAll(result.data!.toList());
      for (int i = 0; i < transactionList.length; i++) {
        if (transactionList.elementAt(i).active == false &&
            transactionList.elementAt(i).finished == false) {
          transactionListExpense.add(transactionList.elementAt(i));
        } else if (transactionList.elementAt(i).active == true &&
            transactionList.elementAt(i).finished == false) {
          transactionListIncome.add(transactionList.elementAt(i));
        } else {
          transactionListFinish.add(transactionList.elementAt(i));
        }
      }
      transactionList.refresh();
      transactionListIncome.refresh();
      transactionListExpense.refresh();
      transactionListFinish.refresh();
    }
  }

  Future<List<UserListData>?> getAllUserByQuery(value) async {
    var result = await api.getAllUserByQueryApi(value);
    if (result != null) {
      return result.data!.toList();
    }
    return null;
  }
}
