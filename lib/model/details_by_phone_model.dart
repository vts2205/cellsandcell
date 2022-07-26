// To parse this JSON data, do
//
//     final getDetailsByPhoneModel = getDetailsByPhoneModelFromJson(jsonString);

import 'dart:convert';

GetDetailsByPhoneModel getDetailsByPhoneModelFromJson(String str) =>
    GetDetailsByPhoneModel.fromJson(json.decode(str));

String getDetailsByPhoneModelToJson(GetDetailsByPhoneModel data) =>
    json.encode(data.toJson());

class GetDetailsByPhoneModel {
  GetDetailsByPhoneModel({
    this.status,
    this.message,
    this.data,
  });

  int? status;
  String? message;
  Data? data;

  factory GetDetailsByPhoneModel.fromJson(Map<String, dynamic> json) =>
      GetDetailsByPhoneModel(
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data!.toJson(),
      };
}

class Data {
  Data({
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

  factory Data.fromJson(Map<String, dynamic> json) => Data(
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
