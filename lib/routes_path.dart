import 'package:SEBL_MYLoan/pages/admin/view/add_member_page.dart';
import 'package:SEBL_MYLoan/pages/admin/view/admin_home_page.dart';
import 'package:SEBL_MYLoan/pages/admin/view/my_account.dart';
import 'package:SEBL_MYLoan/pages/admin/view/requestLoan.dart';
import 'package:SEBL_MYLoan/pages/admin/view/member_charge_list_page.dart';
import 'package:SEBL_MYLoan/pages/admin/view/profile_page.dart';
import 'package:SEBL_MYLoan/pages/admin/view/transaction_list.dart';
import 'package:SEBL_MYLoan/pages/admin/view/update_profile.dart';
import 'package:SEBL_MYLoan/pages/admin/view/user_list_page.dart';
import 'package:SEBL_MYLoan/pages/user/view/car_loan.dart';
import 'package:SEBL_MYLoan/pages/user/view/finished_loans.dart';
import 'package:SEBL_MYLoan/pages/user/view/loan_calculator.dart';
import 'package:SEBL_MYLoan/pages/user/view/location.dart';
import 'package:SEBL_MYLoan/pages/user/view/my_charge_list_page.dart';
import 'package:SEBL_MYLoan/pages/user/view/personal_loan.dart';
import 'package:SEBL_MYLoan/pages/user/view/terms_and_condition.dart';
import 'package:SEBL_MYLoan/pages/user/view/user_home_page.dart';
import 'package:get/get.dart';
import 'package:SEBL_MYLoan/pages/auth/view/login_page.dart';
import 'package:SEBL_MYLoan/routes.dart';
class Routes {
  static final List<GetPage> routes = [
    GetPage(name: RoutesPath.login, page: () => LoginPage()),
    GetPage(name: RoutesPath.addMemberPage, page: () => AddMemberPage()),
    GetPage(name: RoutesPath.adminUserListPage, page: () => UsersListPage()),
    GetPage(name: RoutesPath.memberChargeListPage, page: () => MemberChargeListPage()),
    GetPage(name: RoutesPath.myChargeListPage, page: () => MyChargeListPage()),
    GetPage(name: RoutesPath.requestLoan, page: () => RequestLoan()),
    GetPage(name: RoutesPath.transactionList, page: () => TransactionList()),
    GetPage(name: RoutesPath.userHomePage, page: () => UserHomePage()),
    GetPage(name: RoutesPath.adminHomePage, page: () => AdminHomePage()),
    GetPage(name: RoutesPath.profilePage, page: () => ProfilePage()),
    GetPage(name: RoutesPath.finishedLoans, page: () => FinishedLoans()),
    GetPage(name: RoutesPath.loanCalculator, page: () => LoanCalculator()),
    GetPage(name: RoutesPath.locationPage, page: () => LocationPage()),
    GetPage(name: RoutesPath.updateProfile, page: () => UpdateProfile()),
    GetPage(name: RoutesPath.myAccount, page: () => MyAccount()),
    GetPage(name: RoutesPath.termsAndCondition, page: () => TermsAndCondition()),
    GetPage(name: RoutesPath.carLoan, page: () => CarLoan()),
    GetPage(name: RoutesPath.peronLoan, page: () => PersonalLoan()),
  ];
}