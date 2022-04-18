// To parse this JSON data, do
//
//     final memberChargeListModel = memberChargeListModelFromJson(jsonString);

import 'dart:convert';

MemberChargeListModel memberChargeListModelFromJson(String str) =>
    MemberChargeListModel.fromJson(json.decode(str));

String memberChargeListModelToJson(MemberChargeListModel data) =>
    json.encode(data.toJson());

class MemberChargeListModel {
  MemberChargeListModel({
    this.data,
    this.status,
  });

  List<MemberChargeListData>? data;
  int? status;

  factory MemberChargeListModel.fromJson(Map<String, dynamic> json) =>
      MemberChargeListModel(
        data: json["data"] == null
            ? null
            : List<MemberChargeListData>.from(
                json["data"].map((x) => MemberChargeListData.fromJson(x))),
        status: json["status"] == null ? null : json["status"],
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? null
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "status": status == null ? null : status,
      };
}

class MemberChargeListData {
  MemberChargeListData({
    this.extraInfo,
    this.id,
    this.createdBy,
    this.user,
    this.transactionId,
    this.amount,
    this.paidAt,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  ExtraInfo? extraInfo;
  String? id;
  String? createdBy;
  String? user;
  String? transactionId;
  int? amount;
  DateTime? paidAt;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  factory MemberChargeListData.fromJson(Map<String, dynamic> json) =>
      MemberChargeListData(
        extraInfo: json["extraInfo"] == null
            ? null
            : ExtraInfo.fromJson(json["extraInfo"]),
        id: json["_id"] == null ? null : json["_id"],
        createdBy: json["createdBy"] == null ? null : json["createdBy"],
        user: json["user"] == null ? null : json["user"],
        transactionId:
            json["transactionId"] == null ? null : json["transactionId"],
        amount: json["amount"] == null ? null : json["amount"],
        paidAt: json["paidAt"] == null ? null : DateTime.parse(json["paidAt"]),
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"] == null ? null : json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "extraInfo": extraInfo == null ? null : extraInfo!.toJson(),
        "_id": id == null ? null : id,
        "createdBy": createdBy == null ? null : createdBy,
        "user": user == null ? null : user,
        "transactionId": transactionId == null ? null : transactionId,
        "amount": amount == null ? null : amount,
        "paidAt": paidAt == null ? null : paidAt!.toIso8601String(),
        "createdAt": createdAt == null ? null : createdAt!.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt!.toIso8601String(),
        "__v": v == null ? null : v,
      };
}

class ExtraInfo {
  ExtraInfo({
    this.userName,
    this.userPhone,
    this.createdPersonName,
    this.createdPersonPhone,
  });

  String? userName;
  String? userPhone;
  String? createdPersonName;
  String? createdPersonPhone;

  factory ExtraInfo.fromJson(Map<String, dynamic> json) => ExtraInfo(
        userName: json["userName"] == null ? null : json["userName"],
        userPhone: json["userPhone"] == null ? null : json["userPhone"],
        createdPersonName: json["createdPersonName"] == null
            ? null
            : json["createdPersonName"],
        createdPersonPhone: json["createdPersonPhone"] == null
            ? null
            : json["createdPersonPhone"],
      );

  Map<String, dynamic> toJson() => {
        "userName": userName == null ? null : userName,
        "userPhone": userPhone == null ? null : userPhone,
        "createdPersonName":
            createdPersonName == null ? null : createdPersonName,
        "createdPersonPhone":
            createdPersonPhone == null ? null : createdPersonPhone,
      };
}
