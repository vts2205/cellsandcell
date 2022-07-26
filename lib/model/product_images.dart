// To parse this JSON data, do
//
//     final productImageModel = productImageModelFromJson(jsonString);

import 'dart:convert';

ProductImageModel productImageModelFromJson(String str) =>
    ProductImageModel.fromJson(json.decode(str));

String productImageModelToJson(ProductImageModel data) =>
    json.encode(data.toJson());

class ProductImageModel {
  ProductImageModel({
    this.status,
    this.message,
    this.data,
  });

  int? status;
  String? message;
  Data? data;

  factory ProductImageModel.fromJson(Map<String, dynamic> json) =>
      ProductImageModel(
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
    this.allProducts,
  });

  List<AllProduct>? allProducts;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        allProducts: List<AllProduct>.from(
            json["allProducts"].map((x) => AllProduct.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "allProducts": List<dynamic>.from(allProducts!.map((x) => x.toJson())),
      };
}

class AllProduct {
  AllProduct({
    this.id,
    this.image,
  });

  int? id;
  String? image;

  factory AllProduct.fromJson(Map<String, dynamic> json) => AllProduct(
        id: json["id"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
      };
}
