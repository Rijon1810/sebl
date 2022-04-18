import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:SEBL_MYLoan/pages/admin/model/membe_charge_list_model.dart';
import 'package:SEBL_MYLoan/pages/admin/model/transaction_list_model.dart';
import 'package:SEBL_MYLoan/pages/admin/model/user_list_model.dart';
import 'package:SEBL_MYLoan/pages/auth/model/login_model.dart';
import 'package:get/get.dart' as Getx;
import 'package:SEBL_MYLoan/app.dart';
import 'package:SEBL_MYLoan/authentication/authentication_controller.dart';
import 'package:SEBL_MYLoan/authentication/authentication_state.dart';
import 'package:get_storage/get_storage.dart';

Api api = new Api();
BaseOptions options = BaseOptions(
  baseUrl: AppConstants.API_BASE_URL,
  connectTimeout: 30 * 1000,
  receiveTimeout: 60 * 1000,
  headers: {HttpHeaders.contentTypeHeader: 'application/json'},
);

class Api {
  AuthenticationController authenticationController = Getx.Get.find();

  Api() {
    if (authenticationController.state is Authenticated) {
      String token = 'Bearer ' +
          (authenticationController.state as Authenticated).user.token!;
      options.headers[HttpHeaders.authorizationHeader] = token;
      debugPrint('Token: ' + token);
    } else {
      debugPrint('Api(): UnAuthenticated- No token found');
    }
  }
  Dio getDio({bool isFormData = false}) {
    if (authenticationController.state is Authenticated) {
      String token = 'Bearer ' +
          (authenticationController.state as Authenticated).user.token!;
      debugPrint('Token: ' + token);
      options.headers[HttpHeaders.authorizationHeader] = token;
      options.headers[HttpHeaders.contentTypeHeader] = 'application/json';

      if (isFormData) {
        //debugPrint('isFormData: ' + isFormData.toString());
        options.headers[HttpHeaders.contentTypeHeader] = 'multipart/form-data';
      }
    } else {
      debugPrint('Api(): - No token found');
    }

    return Dio(options);
  }

  /*
 ********************************************************************
 *              Authentication API                                  *
 ********************************************************************
*/
  Future<LoginModel> loginApi(Map<String, dynamic> map) async {
    LoginModel toReturn = LoginModel();
    var result;
    try {
      debugPrint(json.encode(map).toString());
      Dio dio = getDio();
      result = await dio.post('/api/users/login', data: map);
      if (result.statusCode == 200) {
        var loginModel = LoginModel.fromJson(result.data);
        if (loginModel.token != null) {
          GetStorage box = GetStorage("Auth");
          box.write('user', loginModel.toJson());
          return loginModel;
        }
      }
    } on DioError catch (e) {
      debugPrint('loginApi():' + e.response!.data.toString());
    }
    return toReturn;
  }
  Future<LoginModel> updateApi(Map<String, dynamic> map) async {
    LoginModel toReturn = LoginModel();
    var result;
    try {
      debugPrint(json.encode(map).toString());
      Dio dio = getDio();
      result = await dio.put('/api/users/profile', data: map);
      if (result.statusCode == 200) {
        var loginModel = LoginModel.fromJson(result.data);
        if (loginModel.token != null) {
          GetStorage box = GetStorage("Auth");
          box.write('user', loginModel.toJson());
          return loginModel;
        }
      }
    } on DioError catch (e) {
      debugPrint('updateApi():' + e.response!.data.toString());
    }
    return toReturn;
  }

  Future<LoginModel> getProfileInfoApi() async {
    LoginModel toReturn = LoginModel();
    var result;
    try {
      Dio dio = getDio();
      result = await dio.get('/api/users/profile/info');
      if (result.statusCode == 200) {
        var loginModel = LoginModel.fromJson(result.data);
        if (loginModel.token != null) {
          GetStorage box = GetStorage("Auth");
          box.write('user', loginModel.toJson());
          return loginModel;
        }
      }
    } on DioError catch (e) {
      debugPrint('getProfileInfoApi():' + e.response!.data.toString());
    }
    return toReturn;
  }
  Future<LoginModel> registerApi(Map<String, dynamic> map) async {
    LoginModel toReturn = LoginModel();
    var result;
    try {
      debugPrint(json.encode(map).toString());
      Dio dio = getDio();
      result = await dio.post('/api/users', data: map);
      if (result.statusCode == 201) {
        var loginModel = LoginModel.fromJson(result.data);
        if (loginModel.id != null) {
          return loginModel;
        }
      }
    } on DioError catch (e) {
      debugPrint('registerApi():' + e.response!.data.toString());
    }
    return toReturn;
  }

  Future<UserListModel?> getAllUserApi() async {
    var result;
    try {
      Dio dio = getDio();
      result = await dio.get('/api/users');
    } on DioError catch (e) {
      debugPrint('Response - getAllUserApi(): ' + e.toString());
    }
    if (result != null) {
      debugPrint('Response - getAllUserApi():' + result.data.toString());
      return UserListModel.fromJson(result.data);
    }
    return null;
  }

  Future<UserListModel?> getAllUserByQueryApi(String query) async {
    var result;
    try {
      Dio dio = getDio();
      result = await dio.get('/api/users?keyword=$query');
    } on DioError catch (e) {
      debugPrint('Response - getAllUserByQueryApi(): ' + e.toString());
    }
    if (result != null) {
      debugPrint('Response - getAllUserByQueryApi():' + result.data.toString());
      return UserListModel.fromJson(result.data);
    }
    return null;
  }

  Future<MemberChargeListModel?> getAllMemberChargesApi() async {
    var result;
    try {
      Dio dio = getDio();
      result = await dio.get('/api/charges');
    } on DioError catch (e) {
      debugPrint('Response - getAllMemberChargesApi(): ' + e.toString());
    }
    if (result != null) {
      debugPrint(
          'Response - getAllMemberChargesApi():' + result.data.toString());
      return MemberChargeListModel.fromJson(result.data);
    }
    return null;
  }

  Future<MemberChargeListData> createNewMemberChargeApi(
      Map<String, dynamic> map) async {
    MemberChargeListData toReturn = MemberChargeListData();
    var result;
    try {
      debugPrint(json.encode(map).toString());
      Dio dio = getDio();
      result = await dio.post('/api/charges', data: map);
      if (result.statusCode == 201) {
        var memberChargeListData = MemberChargeListData.fromJson(result.data);
        if (memberChargeListData.id != null) {
          return memberChargeListData;
        }
      }
    } on DioError catch (e) {
      debugPrint('createNewMemberCharge():' + e.response!.data.toString());
    }
    return toReturn;
  }

  Future<TransactionListData>  createNewTransactionApi(
      Map<String, dynamic> map) async {
    TransactionListData toReturn = TransactionListData();
    var result;
    try {
      debugPrint(json.encode(map).toString());
      Dio dio = getDio();
      result = await dio.post('/api/loan', data: map);
      if (result.statusCode == 201) {
        var transactionListData = TransactionListData.fromJson(result.data);
        if (transactionListData.id != null) {
          return transactionListData;
        }
      }
    } on DioError catch (e) {
      debugPrint('createNewTransactionApi():' + e.response!.data.toString());
    }
    return toReturn;
  }

  Future<TransactionListModel?> getAllTransactionsApi(id) async {
    var result;
      try {
      Dio dio = getDio();
      debugPrint('/api/loan$id');
      result = await dio.get('/api/loan$id');
    } on DioError catch (e) {
      debugPrint('Response - getAllTransactionsApi(): ' + e.toString());
    }
    if (result != null) {
      debugPrint(
          'Response - getAllTransactionsApi():' + result.data.toString());
      return TransactionListModel.fromJson(result.data);
    }
    return null;
  }
}
