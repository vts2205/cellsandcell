import 'package:cellsandcell/constants/color.dart';
import 'package:cellsandcell/controller/profilecontroller.dart';
import 'package:cellsandcell/controller/walletamountcontroller.dart';
import 'package:cellsandcell/model/profileview.dart';
import 'package:cellsandcell/service/APIService.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';

class ViewQrScreen extends StatefulWidget {
  const ViewQrScreen({Key? key}) : super(key: key);

  @override
  State<ViewQrScreen> createState() => _ViewQrCodeState();
}

class _ViewQrCodeState extends State<ViewQrScreen> {
  var walletcontroller = Get.put(WalletController());

  ProfileModel? profileModel;

  var isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    walletcontroller.fetqrCode();
    super.initState();
    getData();
  }

  getData() async {
    profileModel = (await APIService().FetchProfile());
    if (profileModel != null) {
      setState(() {
        isLoading = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: buildBody());
  }

  buildBody() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        isLoading == false
            ? Container()
            : Text(
                '${profileModel?.name}',
                style: TextStyle(
                    fontSize: 30, fontWeight: FontWeight.bold, color: purple),
              ),
        const SizedBox(height: 30),
        Obx(() {
          if (walletcontroller.qrData.value == "") {
            return const Center(
                child: CircularProgressIndicator(
              color: Colors.black,
            ));
          } else if (walletcontroller.qrData.value == '' ||
              walletcontroller.qrData.value.isEmpty) {
            return const Center(child: Text("No QR found"));
          }
          return Center(
            child: buildQRImage(walletcontroller.qrData.value),
          );
        }),
        const SizedBox(height: 30),
        isLoading == false
            ? Container()
            : Text('${profileModel?.phone}',
                style: TextStyle(
                    fontSize: 30, fontWeight: FontWeight.bold, color: purple))
      ],
    );
  }

  buildQRImage(String qrCodeval) {
    return SizedBox(
      width: 400,
      height: 400,
      child: QrImage(
        data: qrCodeval,
        version: QrVersions.auto,
        size: 200.0,
      ),
    );
  }
}
