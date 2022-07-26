// To parse this JSON data, do
//
//     final walletAmount = walletAmountFromJson(jsonString);

import 'dart:convert';

WalletAmount walletAmountFromJson(String str) => WalletAmount.fromJson(json.decode(str));

String walletAmountToJson(WalletAmount data) => json.encode(data.toJson());

class WalletAmount {
  WalletAmount({
    required this.status,
    required this.walletAmount,
  });

  int status;
  int walletAmount;

  factory WalletAmount.fromJson(Map<String, dynamic> json) => WalletAmount(
    status: json["status"],
    walletAmount: json["walletAmount"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "walletAmount": walletAmount,
  };
}
