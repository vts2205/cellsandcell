// To parse this JSON data, do
//
//     final payByPhoneModel = payByPhoneModelFromJson(jsonString);

import 'dart:convert';

PayByPhoneModel payByPhoneModelFromJson(String str) =>
    PayByPhoneModel.fromJson(json.decode(str));

String payByPhoneModelToJson(PayByPhoneModel data) =>
    json.encode(data.toJson());

class PayByPhoneModel {
  PayByPhoneModel({
    this.status,
    this.msg,
    this.data,
  });

  int? status;
  String? msg;
  Data? data;

  factory PayByPhoneModel.fromJson(Map<String, dynamic> json) =>
      PayByPhoneModel(
        status: json["status"],
        msg: json["msg"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
        "data": data!.toJson(),
      };
}

class Data {
  Data({
    this.from,
    this.to,
    this.amount,
  });

  List<From>? from;
  List<From>? to;
  String? amount;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        from: List<From>.from(json["from"].map((x) => From.fromJson(x))),
        to: List<From>.from(json["to"].map((x) => From.fromJson(x))),
        amount: json["amount"],
      );

  Map<String, dynamic> toJson() => {
        "from": List<dynamic>.from(from!.map((x) => x.toJson())),
        "to": List<dynamic>.from(to!.map((x) => x.toJson())),
        "amount": amount,
      };
}

class From {
  From({
    this.id,
    this.name,
    this.address,
    this.phone,
    this.place,
    this.image,
    this.branchId,
    this.currentPosition,
    this.usersCount,
    this.userId,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? name;
  String? address;
  String? phone;
  dynamic place;
  String? image;
  int? branchId;
  String? currentPosition;
  dynamic usersCount;
  String? userId;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory From.fromJson(Map<String, dynamic> json) => From(
        id: json["id"],
        name: json["name"],
        address: json["address"],
        phone: json["phone"],
        place: json["place"],
        image: json["image"],
        branchId: json["branch_id"],
        currentPosition: json["current_position"],
        usersCount: json["users_count"],
        userId: json["user_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "address": address,
        "phone": phone,
        "place": place,
        "image": image,
        "branch_id": branchId,
        "current_position": currentPosition,
        "users_count": usersCount,
        "user_id": userId,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
      };
}
