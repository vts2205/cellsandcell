// To parse this JSON data, do
//
//     final offerImageModel = offerImageModelFromJson(jsonString);

import 'dart:convert';

OfferImageModel offerImageModelFromJson(String str) =>
    OfferImageModel.fromJson(json.decode(str));

String offerImageModelToJson(OfferImageModel data) =>
    json.encode(data.toJson());

class OfferImageModel {
  OfferImageModel({
    this.status,
    this.message,
    this.data,
  });

  int? status;
  String? message;
  Data? data;

  factory OfferImageModel.fromJson(Map<String, dynamic> json) =>
      OfferImageModel(
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
    this.offers,
  });

  List<Offer>? offers;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        offers: List<Offer>.from(json["offers"].map((x) => Offer.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "offers": List<dynamic>.from(offers!.map((x) => x.toJson())),
      };
}

class Offer {
  Offer({
    this.id,
    this.image,
  });

  int? id;
  String? image;

  factory Offer.fromJson(Map<String, dynamic> json) => Offer(
        id: json["id"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
      };
}
