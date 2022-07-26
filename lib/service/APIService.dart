import 'dart:convert';
import 'package:cellsandcell/constants/apiconstants.dart';
import 'package:cellsandcell/model/details_by_phone_model.dart';
import 'package:cellsandcell/model/notification.dart';
import 'package:cellsandcell/model/pay_by_phone_model.dart';
import 'package:cellsandcell/model/product_images.dart';
import 'package:cellsandcell/model/profile_edit.dart';
import 'package:cellsandcell/model/profileview.dart';
import 'package:cellsandcell/model/transactions.dart';
import 'package:cellsandcell/model/wallet_history.dart';
import 'package:cellsandcell/model/walletamount.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import '../model/offers_images.dart';
import '../model/pay_qr_model.dart';

class APIService {
  final box = GetStorage();

  Future getUserLogin(String email, String password) async {
    String completeUrl = APIConstants.BaseUrl + APIConstants.KLogin;
    var uri = Uri.parse(completeUrl);

    var response = await http.post(uri,
        headers: {"Accept": "Application/json"},
        body: {"email": email, "password": password});
    var convertedDataToJson = jsonDecode(response.body);

    return convertedDataToJson;
  }

  Future<ProfileModel?> FetchProfile() async {
    String token = box.read("token");
    String completeUrl = APIConstants.BaseUrl + APIConstants.KProfile;
    var url = Uri.parse(completeUrl);

    try {
      final response = await http.get(
        url,
        headers: {'Authorization': 'Bearer $token'},
      );
      print('Token : $token');
      print("====Map====${response.body.toString()}");
      if (response.statusCode == 200) {
        print(response.body.toString());
        print('json.decode(response.body)....');
        print(json.decode(response.body));
        ProfileModel profileModel =
            ProfileModel.fromJson(json.decode(response.body));
        print('profileModeltoJson///');
        print(profileModel.toJson());
        return profileModel;
      } else {
        return null;
      }
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  Future<ProfileEdit?> FetchProfileEdit() async {
    String token = box.read("token");
    String completeUrl = APIConstants.BaseUrl + APIConstants.KProfileEdit;
    var url = Uri.parse(completeUrl);
    try {
      final response = await http.get(
        url,
        headers: {'Authorization': 'Bearer $token'},
      );
      print("====Map====${response.body.toString()}");
      if (response.statusCode == 200) {
        var profileEdit = ProfileEdit.fromJson(json.decode(response.body));
        return profileEdit;
      } else {
        return null;
      }
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future ProfileUpdate(String name, String phoneNo) async {
    String token = box.read("token");
    String completeUrl = APIConstants.BaseUrl + APIConstants.KProfileUpdate;
    var url = Uri.parse(completeUrl);

    var response = await http.post(url,
        headers: {'Authorization': 'Bearer $token'},
        body: {"name": name, "phone": phoneNo});

    var convertedDataToJson = json.decode(response.body);
    print(convertedDataToJson);
    return convertedDataToJson;
  }

  Future<String> FetchQRCode() async {
    String token = box.read("token");
    String completeUrl = APIConstants.BaseUrl + APIConstants.KQRGenerate;
    var url = Uri.parse(completeUrl);

    try {
      final response = await http.get(
        url,
        headers: {'Authorization': 'Bearer $token'},
      );
      print('Token : $token');
      print("====Map====${response.body.toString()}");
      if (response.statusCode == 200) {
        print('===========${json.decode(response.body)}========');
        // print('===========${viewQRCode.data?.user[0].phone}========');
        Map<String, dynamic> data = jsonDecode(response.body);
        String token = data["data"]["qr"];
        print('tokee.......');
        print(token);

        // var viewQRCode = ViewQrCodeModel.fromJson(json.decode(response.body));
        // print('viewQRCodetoJson//////');
        // print(viewQRCode.toJson());
        // print('===========${viewQRCode.data?.user[0].name}========');
        // print('===========${viewQRCode.data?.user[0].phone}========');
        // print('===========${viewQRCode.data?.qr}========');
        return token;
      } else {
        return "";
      }
    } catch (e) {
      throw e.toString();
    }
  }

  Future<void> checkQRCode(String qrCode) async {
    String token = box.read("token");
    String completeUrl = APIConstants.BaseUrl + APIConstants.KQRCheck;
    var url = Uri.parse(completeUrl);

    try {
      final response = await http.post(url,
          headers: {'Authorization': 'Bearer $token'}, body: {"qr": qrCode});
      print("====Map====${response.body.toString()}");

      if (response.statusCode == 200) {
      } else {
        // return response.bo;
      }
    } catch (e) {
      throw e.toString();
    }
  }

  Future<PayQRModel?> payChechQr(String amount, String paytoken) async {
    String token = box.read("token");
    String password = box.read("password");

    String completeUrl = 'http://mobi.webstormers.com/api/V1/qrcode/pay';
    // ?amount=$amount&password=$password&pay-token=$paytoken&token=$paytoken';
    print('completeUrl....');
    print(completeUrl);
    var url = Uri.parse(completeUrl);
    print('data..oinside.');
    print(token);
    print(amount);
    print(paytoken);
    print(password);

    try {
      final response = await http.post(url, headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      }, body: {
        "token": paytoken,
        "amount": amount,
        "pay-token": paytoken,
        "password": password
      });
      print("====Map====${response.body.toString()}");

      if (response.statusCode == 200) {
        var payQRCode = PayQRModel.fromJson(json.decode(response.body));
        return payQRCode;
      }
    } catch (e) {
      throw e.toString();
    }
  }

  Future<TransactionModel?> fetchTransactions() async {
    String token = box.read("token");
    String completeUrl = APIConstants.BaseUrl + APIConstants.KTransactions;
    var url = Uri.parse(completeUrl);

    try {
      final response = await http.get(
        url,
        headers: {'Authorization': 'Bearer $token'},
      );
      print('Token : $token');
      print("====Map====${response.body.toString()}");
      if (response.statusCode == 200) {
        var transactionDetails =
            TransactionModel.fromJson(json.decode(response.body));

        return transactionDetails;
      } else {
        return null;
      }
    } catch (e) {
      print(e.toString());
      throw e.toString();
    }
  }

  Future<WalletAmount?> fetchWalletAmount() async {
    String token = box.read("token");
    String completeUrl = APIConstants.BaseUrl + APIConstants.KWalletAmount;
    var url = Uri.parse(completeUrl);

    try {
      final response = await http.get(
        url,
        headers: {'Authorization': 'Bearer $token'},
      );
      print('Token : $token');
      print("====Map====${response.body.toString()}");
      if (response.statusCode == 200) {
        var walletAmount = WalletAmount.fromJson(json.decode(response.body));
        return walletAmount;
      } else {
        return null;
      }
    } catch (e) {
      print(e.toString());
      throw e.toString();
    }
  }

  Future SignOut() async {
    String token = box.read("token");
    String completeUrl = APIConstants.BaseUrl + APIConstants.KSignOut;
    var url = Uri.parse(completeUrl);

    try {
      var response = await http.post(
        url,
        headers: {'Authorization': 'Bearer $token'},
      );
      if (response.statusCode == 200) {
        var convertedDataToJson = json.decode(response.body);
        return convertedDataToJson;
      }
      return null;
    } catch (e) {
      print(e.toString());
      throw e.toString();
    }
  }

  // Future<PhoneQrModel?> phoneNumberQRCode(String phone) async {
  //   String token = box.read("token");
  //   String completeUrl =
  //       'http://13.232.107.13/api/V1/qrcode/generatefromphone?phone=$phone';
  //   print('completeUrl.....');
  //   print(completeUrl);
  //   print('token....');
  //   print(token);
  //   var url = Uri.parse(completeUrl);
  //
  //   try {
  //     final response = await http.post(url, headers: {
  //       'Accept': 'application/json',
  //       'Authorization': 'Bearer $token',
  //     });
  //     print("====Map====${response.body.toString()}");
  //
  //     if (response.statusCode == 200) {
  //       var data = json.decode(response.body);
  //       if (data['status'] == 1) {
  //         var phonechkresponse = PhoneQrModel.fromJson(data);
  //         return phonechkresponse;
  //       } else {
  //         commonfunction.toast(data['message'] ?? 'Not Found', Colors.red);
  //
  //         return null;
  //       }
  //     } else {}
  //   } catch (e) {
  //     throw e.toString();
  //   }
  // }

  Future<WalletHistoryListModel?> walletHistoryList() async {
    var token = box.read('token');
    var client = http.Client();
    var completeUrl = APIConstants.BaseUrl + APIConstants.walletHistory;
    var uri = Uri.parse(completeUrl);
    final response = await client.get(
      uri,
      headers: {'Authorization': 'Bearer $token'},
    );
    print(response.body);
    print('StatusCode: ${response.statusCode}');
    if (response.statusCode == 200) {
      print(response.body.toString());
      var json = response.body;
      return walletHistoryListModelFromJson(json);
    } else {
      return null;
    }
  }

  Future<NotificationListModel?> notificationList() async {
    var token = box.read('token');
    var client = http.Client();
    var completeUrl = APIConstants.BaseUrl + APIConstants.notifications;
    var uri = Uri.parse(completeUrl);
    final response = await client.get(
      uri,
      headers: {'Authorization': 'Bearer $token'},
    );
    print(response.body);
    print('StatusCode: ${response.statusCode}');
    if (response.statusCode == 200) {
      print(response.body.toString());
      var json = response.body;
      return notificationListModelFromJson(json);
    } else {
      return null;
    }
  }

  Future<ProductImageModel?> productImage() async {
    var token = box.read('token');
    var client = http.Client();
    var completeUrl = APIConstants.BaseUrl + APIConstants.productImage;
    var uri = Uri.parse(completeUrl);
    final response = await client.get(
      uri,
      headers: {'Authorization': 'Bearer $token'},
    );
    print(response.body);
    print('StatusCode: ${response.statusCode}');
    if (response.statusCode == 200) {
      print(response.body.toString());
      var json = response.body;
      return productImageModelFromJson(json);
    } else {
      return null;
    }
  }

  Future<OfferImageModel?> offerImage() async {
    var token = box.read('token');
    var client = http.Client();
    var completeUrl = APIConstants.BaseUrl + APIConstants.offerImage;
    var uri = Uri.parse(completeUrl);
    final response = await client.get(
      uri,
      headers: {'Authorization': 'Bearer $token'},
    );
    print(response.body);
    print('StatusCode: ${response.statusCode}');
    if (response.statusCode == 200) {
      print(response.body.toString());
      var json = response.body;
      return offerImageModelFromJson(json);
    } else {
      return null;
    }
  }

  Future<GetDetailsByPhoneModel?> getDetails(String phone) async {
    var token = box.read('token');
    var client = http.Client();
    var params = {'phone': phone};
    var completeUrl = APIConstants.BaseUrl + APIConstants.offerImage;
    var uri = Uri.parse(completeUrl);
    var newUri = uri.replace(queryParameters: params);
    final response = await client.get(
      newUri,
      headers: {'Authorization': 'Bearer $token'},
    );
    print(response.body);
    print('StatusCode: ${response.statusCode}');
    if (response.statusCode == 200) {
      print(response.body.toString());
      var json = response.body;
      return getDetailsByPhoneModelFromJson(json);
    } else {
      return null;
    }
  }

  Future payByPhone(String phoneNumber, amount) async {
    var token = box.read('token');
    var client = http.Client();
    var params = {'phoneNo': phoneNumber, 'amount': amount};
    var completeUrl = APIConstants.BaseUrl + APIConstants.payByPhone;
    var uri = Uri.parse(completeUrl);
    var newUri = uri.replace(queryParameters: params);
    print('======new uri = $newUri =======');
    final response =
        await client.post(newUri, headers: {'Authorization': 'Bearer $token'});
    print(response.body);
    print('StatusCode: ${response.statusCode}');
    if (response.statusCode == 200) {
      print(response.body.toString());
      var convertedDataToJson = json.decode(response.body);
      return convertedDataToJson;
    } else {
      return null;
    }
  }
}
