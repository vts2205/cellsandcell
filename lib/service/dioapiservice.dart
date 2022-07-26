import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

import '../model/pay_qr_model.dart';

class ApiDio {
  final box = GetStorage();

  Future<PayQRModel?> payChechQr(String amount, String paytoken) async {
    String token = box.read("token");
    String password = box.read("password");

    var dio = Dio(); // with default Options

// Set default configs
    dio.options.baseUrl = 'http://mobi.webstormers.com/api/V1/qrcode';
    // dio.options.connectTimeout = 5000; //5s
    // dio.options.receiveTimeout = 5000;

// or new Dio with a BaseOptions instance.

    // dio.options.headers["Content-Type"] ="multipart/form-data";
    dio.options.headers["Accept"] ="application/json";

    //  'Accept':'application/json'

    dio.options.headers["Authorization"] = "Bearer $token";
    

    var formData = FormData.fromMap({
      "token": paytoken,
      "amount": amount,
      "pay-token": paytoken,
      "password": password
     
    });
    var response = await dio.post('/pay', data: formData);
    print(response.data);
  }
}
