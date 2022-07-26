import 'package:cellsandcell/model/qrgenerate.dart';
import 'package:cellsandcell/model/walletamount.dart';
import 'package:cellsandcell/service/APIService.dart';
import 'package:get/get.dart';

class WalletController extends GetxController {
  var WalletInfo = <WalletAmount>[].obs;
  var isLoading = true.obs;
  var viewQrCoderesponse = ViewQrCodeModel().obs;

  @override
  void onInit() async {
    FetchProfileInfo();
    super.onInit();
  }

  void FetchProfileInfo() async {
    try {
      isLoading(true);

      var walletInfo = await APIService().fetchWalletAmount();
      if (walletInfo != null && WalletInfo.isEmpty) {
        WalletInfo.assign(walletInfo);
      }
    } finally {
      isLoading(false);
    }
  }

  var qrData = "".obs;
  void fetqrCode() async {
    try {
      isLoading(true);

      var result = await APIService().FetchQRCode();
      // if (result?.status == 1) {
      qrData.value = result;
      print('  qrData.value/////');
      print(qrData.value);

      // WalletInfo.assign(walletInfo);
      // } else {}
    } finally {
      isLoading(false);
    }
  }

  void chkqrScan() async {
    try {
      isLoading(true);

      var result = await APIService().FetchQRCode();
      // if (result?.status == 1)
      // {
      qrData.value = result;

      // WalletInfo.assign(walletInfo);
      // } else {}
    } finally {
      isLoading(false);
    }
  }

  void paytoScan() async {
    try {
      isLoading(true);

      var result = await APIService().FetchQRCode();
      // if (result?.status == 1) {
      qrData.value = result;
      // viewQrCoderesponse.value = result!;

      // WalletInfo.assign(walletInfo);
      // } else {}
    } finally {
      isLoading(false);
    }
  }
}
