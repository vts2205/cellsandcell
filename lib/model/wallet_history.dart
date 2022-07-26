// To parse this JSON data, do
//
//     final walletHistoryListModel = walletHistoryListModelFromJson(jsonString);

import 'dart:convert';

WalletHistoryListModel walletHistoryListModelFromJson(String str) =>
    WalletHistoryListModel.fromJson(json.decode(str));

String walletHistoryListModelToJson(WalletHistoryListModel data) =>
    json.encode(data.toJson());

class WalletHistoryListModel {
  WalletHistoryListModel({
    this.status,
    this.message,
    this.data,
  });

  int? status;
  String? message;
  Data? data;

  factory WalletHistoryListModel.fromJson(Map<String, dynamic> json) =>
      WalletHistoryListModel(
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data?.toJson(),
      };
}

class Data {
  Data({
    this.transactions,
  });

  List<Transaction>? transactions;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        transactions: List<Transaction>.from(
            json["transactions"].map((x) => Transaction.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "transactions":
            List<dynamic>.from(transactions!.map((x) => x.toJson())),
      };
}

class Transaction {
  Transaction({
    this.id,
    this.profileId,
    this.details,
    this.amount,
    this.fromTo,
    this.cdStatus,
    this.count,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  int? profileId;
  String? details;
  String? amount;
  dynamic fromTo;
  String? cdStatus;
  int? count;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Transaction.fromJson(Map<String, dynamic> json) => Transaction(
        id: json["id"],
        profileId: json["profile_id"],
        details: json["details"],
        amount: json["amount"],
        fromTo: json["from_to"],
        cdStatus: json["cd_status"],
        count: json["count"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "profile_id": profileId,
        "details": details,
        "amount": amount,
        "from_to": fromTo,
        "cd_status": cdStatus,
        "count": count,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
