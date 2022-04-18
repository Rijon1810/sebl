// To parse this JSON data, do
//
//     final userListModel = userListModelFromJson(jsonString);

import 'dart:convert';

UserListModel userListModelFromJson(String str) =>
    UserListModel.fromJson(json.decode(str));

String userListModelToJson(UserListModel data) => json.encode(data.toJson());

class UserListModel {
  UserListModel({
    this.data,
    this.status,
  });

  List<UserListData>? data;
  int? status;

  factory UserListModel.fromJson(Map<String, dynamic> json) => UserListModel(
        data: json["data"] == null
            ? null
            : List<UserListData>.from(
                json["data"].map((x) => UserListData.fromJson(x))),
        status: json["status"] == null ? null : json["status"],
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? null
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "status": status == null ? null : status,
      };
}

class UserListData {
  UserListData({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.isAdmin,
    this.address,
  });

  String? id;
  String? name;
  String? email;
  String? phone;
  bool? isAdmin;
  String? address;

  factory UserListData.fromJson(Map<String, dynamic> json) => UserListData(
        id: json["_id"] == null ? null : json["_id"],
        name: json["name"] == null ? null : json["name"],
        email: json["email"] == null ? null : json["email"],
        phone: json["phone"] == null ? null : json["phone"],
        isAdmin: json["isAdmin"] == null ? null : json["isAdmin"],
        address: json["address"] == null ? null : json["address"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id == null ? null : id,
        "name": name == null ? null : name,
        "email": email == null ? null : email,
        "phone": phone == null ? null : phone,
        "isAdmin": isAdmin == null ? null : isAdmin,
        "address": address == null ? null : address,
      };
}
