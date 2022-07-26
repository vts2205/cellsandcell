import 'dart:async';
import 'dart:convert';
import 'package:cellsandcell/constants/commonfunction.dart';
import 'package:cellsandcell/view/exchangemoney.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:cellsandcell/constants/apiconstants.dart';
import 'package:cellsandcell/model/pay_qr_model.dart';
import 'package:cellsandcell/model/phoneqr.dart';
import 'package:cellsandcell/model/qrgenerate.dart';
import 'package:cellsandcell/service/APIService.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class QRGenerateController extends GetxController {
  final box = GetStorage();
  var QRInfo = ViewQrCodeModel().obs;
  var payQRresponse = PayQRModel().obs;
  // var phonenumberChkresponse = PhoneQrModel().obs;

  var isLoading = true.obs;
  var paytoken = '';
  @override
  void onInit() {
    fetchQRInfo();
    super.onInit();
  }

  var qrCodedata = "".obs;

  void fetchQRInfo() async {
    try {
      isLoading(true);
      var qrInfo = await APIService().FetchQRCode();
      if (qrInfo != "") {
        // QRInfo.assign(qrInfo);
        // QRInfo.value = qrInfo;
        qrCodedata.value = qrInfo;
      }
    } finally {
      isLoading(false);
    }
  }

  void CheckQRInfo(String qr) async {
    var number = 0;
    if (number == 0) {
      Timer(const Duration(seconds: 2), () {
        number = 1;
      });

      try {
        isLoading(true);
        String token = box.read("token");
        String completeUrl = APIConstants.BaseUrl + APIConstants.KQRCheck;
        var url = Uri.parse(completeUrl);

        try {
          final response = await http.post(url,
              headers: {'Authorization': 'Bearer $token'}, body: {"qr": qr});

          if (response.statusCode == 200) {
            var data = jsonDecode(response.body);
            if (data['status'] == 0) {
              commonfunction.toast(data['msg'], Colors.red);
              return;
            }

            if (data['data']['pay-token'] != '') {
              Get.to(ExchangeMoney(paytoken: data['data']['pay-token']));
            }
          }
        } catch (e) {
          throw e.toString();
        }
      } finally {
        isLoading(false);
      }
    }
  }

  void payrQR(String payqr, String amount) async {
    try {
      isLoading(true);

      var qrInfo = await APIService().payChechQr(amount, payqr);

      if (qrInfo != null) {
        payQRresponse.value = qrInfo;
      }
    } finally {
      isLoading(false);
    }
  }

  // void phonechkQr(String mobilenumber) async {
  //   try {
  //     isLoading(true);
  //
  //     var result = await APIService().phoneNumberQRCode(mobilenumber);
  //
  //     if (result != null) {
  //       phonenumberChkresponse.value = result;
  //
  //       if (phonenumberChkresponse.value.data!.qr != '') {
  //         Get.to(
  //             ExchangeMoney(paytoken: phonenumberChkresponse.value.data!.qr!));
  //       }
  //     }
  //   } finally {
  //     isLoading(false);
  //   }
  // }
}
