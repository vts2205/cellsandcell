class APIConstants {
  static const BaseUrl = "http://cellsandcell.com";

  static const KLogin = "/api/V1/signin";
  static const KQRGenerate = "/api/V1/qrcode/generate";
  static const KQRCheck = "/api/V1/qrcode/check";
  static const KPay = "/api/V1/qrcode/pay";
  static const KTransactions = "/api/V1/transaction/show";
  static const KWalletAmount = "/api/V1/wallet/amount";
  static const KProfile = "/api/V1/profile";
  static const KProfileEdit = "/api/V1/profile/edit";
  static const KProfileUpdate = "/api/V1/profile/update";
  static const walletHistory = "/api/V1/userwallethistory";
  static const notifications = "/api/V1/notifications";
  static const productImage = "/api/V1/getproducts";
  static const offerImage = "/api/V1/offerimages";
  static const detailsByPhone = "/api/V1/qrcode/profilefromphone";
  static const payByPhone = "/api/V1/paytophonenumber";
  static const KSignOut = "/api/V1/sign-out";
}
