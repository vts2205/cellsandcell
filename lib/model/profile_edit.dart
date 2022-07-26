// To parse this JSON data, do
//
//     final profileEdit = profileEditFromJson(jsonString);

import 'dart:convert';

ProfileEdit profileEditFromJson(String str) => ProfileEdit.fromJson(json.decode(str));

String profileEditToJson(ProfileEdit data) => json.encode(data.toJson());

class ProfileEdit {
  ProfileEdit({
    required this.status,
    required this.profileEdit,
  });

  int status;
  List<ProfileEditElement> profileEdit;

  factory ProfileEdit.fromJson(Map<String, dynamic> json) => ProfileEdit(
    status: json["status"],
    profileEdit: List<ProfileEditElement>.from(json["profileEdit"].map((x) => ProfileEditElement.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "profileEdit": List<dynamic>.from(profileEdit.map((x) => x.toJson())),
  };
}

class ProfileEditElement {
  ProfileEditElement({
    required this.id,
    required this.name,
    this.address,
    required this.phone,
    required this.image,
    required this.branchId,
    required this.currentPosition,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String name;
  dynamic address;
  String phone;
  String image;
  int branchId;
  String currentPosition;
  String userId;
  DateTime createdAt;
  DateTime updatedAt;

  factory ProfileEditElement.fromJson(Map<String, dynamic> json) => ProfileEditElement(
    id: json["id"],
    name: json["name"],
    address: json["address"],
    phone: json["phone"],
    image: json["image"]??'',
    branchId: json["branch_id"],
    currentPosition: json["current_position"],
    userId: json["user_id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "address": address,
    "phone": phone,
    "image": image,
    "branch_id": branchId,
    "current_position": currentPosition,
    "user_id": userId,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
