// To parse this JSON data, do
//
//     final transactionListModel = transactionListModelFromJson(jsonString);

import 'dart:convert';

TransactionListModel transactionListModelFromJson(String str) =>
    TransactionListModel.fromJson(json.decode(str));

String transactionListModelToJson(TransactionListModel data) =>
    json.encode(data.toJson());

class TransactionListModel {
  TransactionListModel({
    this.data,
    this.status,
  });

  List<TransactionListData>? data;
  int? status;

  factory TransactionListModel.fromJson(Map<String, dynamic> json) =>
      TransactionListModel(
        data: json["data"] == null
            ? null
            : List<TransactionListData>.from(
                json["data"].map((x) => TransactionListData.fromJson(x))),
        status: json["status"] == null ? null : json["status"],
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? null
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "status": status == null ? null : status,
      };
}

class TransactionListData {
  TransactionListData({
    this.id,
    this.requestedBy,
    this.transactionNumber,
    this.active,
    this.finished,
    this.amount,
    this.name,
    this.address,
    this.phone,
    this.nid,
    this.salary,
    this.loanTime,
    this.purpose,
    this.age,
    this.loanType,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.transactionAt,
    this.title,
    this.details,
  });

  String? id;
  String? requestedBy;
  String? transactionNumber;
  bool? active;
  bool? finished;
  int? amount;
  String? name;
  String? address;
  String? phone;
  String? nid;
  String? salary;
  String? loanTime;
  String? purpose;
  String? age;
  String? loanType;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  DateTime? transactionAt;
  String? title;
  String? details;

  factory TransactionListData.fromJson(Map<String, dynamic> json) =>
      TransactionListData(
        id: json["_id"] == null ? null : json["_id"],
        requestedBy: json["requestedBy"] == null ? null : json["requestedBy"],
        transactionNumber: json["transactionNumber"] == null
            ? null
            : json["transactionNumber"],
        active: json["active"] == null ? null : json["active"],
        finished: json["finished"] == null ? null : json["finished"],
        amount: json["amount"] == null ? null : json["amount"],
        name: json["name"] == null ? null : json["name"],
        address: json["address"] == null ? null : json["address"],
        phone: json["phone"] == null ? null : json["phone"],
        nid: json["nid"] == null ? null : json["nid"],
        salary: json["salary"] == null ? null : json["salary"],
        loanTime: json["loanTime"] == null ? null : json["loanTime"],
        purpose: json["purpose"] == null ? null : json["purpose"],
        age: json["age"] == null ? null : json["age"],
        loanType: json["loanType"] == null ? null : json["loanType"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"] == null ? null : json["__v"],
        transactionAt: json["transactionAt"] == null
            ? null
            : DateTime.parse(json["transactionAt"]),
        title: json["title"] == null ? null : json["title"],
        details: json["details"] == null ? null : json["details"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id == null ? null : id,
        "requestedBy": requestedBy == null ? null : requestedBy,
        "transactionNumber":
            transactionNumber == null ? null : transactionNumber,
        "active": active == null ? null : active,
        "finished": finished == null ? null : finished,
        "amount": amount == null ? null : amount,
        "name": name == null ? null : name,
        "address": address == null ? null : address,
        "phone": phone == null ? null : phone,
        "nid": nid == null ? null : nid,
        "salary": salary == null ? null : salary,
        "loanTime": loanTime == null ? null : loanTime,
        "purpose": purpose == null ? null : purpose,
        "age": age == null ? null : age,
        "loanType": loanType == null ? null : loanType,
        "createdAt": createdAt == null ? null : createdAt!.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt!.toIso8601String(),
        "__v": v == null ? null : v,
        "transactionAt":
            transactionAt == null ? null : transactionAt!.toIso8601String(),
        "title": title == null ? null : title,
        "details": details == null ? null : details,
      };
}
