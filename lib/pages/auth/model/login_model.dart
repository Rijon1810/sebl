// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  LoginModel({
    this.id,
    this.name,
    this.phone,
    this.address,
    this.email,
    this.isAdmin,
    this.totalInvestment,
    this.token,
  });

  String? id;
  String? name;
  String? phone;
  String? address;
  String? email;
  bool? isAdmin;
  int? totalInvestment;
  String? token;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    id: json["_id"] == null ? null : json["_id"],
    name: json["name"] == null ? null : json["name"],
    phone: json["phone"] == null ? null : json["phone"],
    address: json["address"] == null ? null : json["address"],
    email: json["email"] == null ? null : json["email"],
    isAdmin: json["isAdmin"] == null ? null : json["isAdmin"],
    totalInvestment: json["totalInvestment"] == null ? null : json["totalInvestment"],
    token: json["token"] == null ? null : json["token"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id == null ? null : id,
    "name": name == null ? null : name,
    "phone": phone == null ? null : phone,
    "address": address == null ? null : address,
    "email": email == null ? null : email,
    "isAdmin": isAdmin == null ? null : isAdmin,
    "totalInvestment": totalInvestment == null ? null : totalInvestment,
    "token": token == null ? null : token,
  };
}
