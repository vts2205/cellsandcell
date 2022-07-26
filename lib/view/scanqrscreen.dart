import 'dart:io';
import 'package:cellsandcell/constants/color.dart';
import 'package:cellsandcell/controller/qrgeneratecontroller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ScanQrScreen extends StatefulWidget {
  const ScanQrScreen({Key? key}) : super(key: key);

  @override
  _ScanQrScreenState createState() => _ScanQrScreenState();
}

class _ScanQrScreenState extends State<ScanQrScreen> {
  // final qrKey = GlobalKey(debugLabel: 'QR');
  //
  // QRViewController? controller;
  // Barcode? barcode;
  // var qrcontroler = Get.put(QRGenerateController());
  //
  // @override
  // void reassemble() {
  //   super.reassemble();
  //   if (Platform.isAndroid) {
  //     controller!.resumeCamera();
  //   }
  // }
  //
  // @override
  // Widget build(BuildContext context) {
  //   return SafeArea(
  //     child: Scaffold(
  //       body: buildBody(),
  //     ),
  //   );
  // }
  //
  // buildBody() {
  //   return Stack(
  //     alignment: Alignment.center,
  //     children: [
  //       buildQRScan(),
  //       //Positioned(bottom: 80, child: buildPickImage()),
  //       Positioned(
  //           bottom: 100,
  //           child: Text(
  //             barcode != null ? 'Result : ${barcode?.code}' : 'Scan a code',
  //             style: const TextStyle(fontSize: 20, color: Colors.white),
  //             maxLines: 3,
  //           ))
  //     ],
  //   );
  // }
  //
  // buildQRScan() {
  //   return QRView(
  //     key: qrKey,
  //     onQRViewCreated: onQRViewCreated,
  //     overlay: QrScannerOverlayShape(
  //         borderWidth: 8,
  //         borderRadius: 8,
  //         borderColor: purple,
  //         cutOutSize: MediaQuery.of(context).size.width * 0.8),
  //   );
  // }
  //
  // void onQRViewCreated(QRViewController controller) {
  //   this.controller = controller;
  //   controller.scannedDataStream.listen((barcode) {
  //     print('barcode......code');
  //     print(barcode.code);
  //     setState(() {
  //       this.barcode = barcode;
  //       if (barcode.code != '' || barcode.code != null) {
  //         qrcontroler.CheckQRInfo(barcode.code!);
  //       }
  //     });
  //   });
  // }
  //
  // @override
  // void dispose() {
  //   controller?.dispose();
  //   super.dispose();
  // }

  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;
  var qrcontroler = Get.put(QRGenerateController());
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          QRView(
            key: qrKey,
            onQRViewCreated: _onQRViewCreated,
            // overlay: QrScannerOverlayShape(
            //     borderWidth: 8,
            //     borderRadius: 8,
            //     borderColor: purple,
            //     cutOutSize: MediaQuery.of(context).size.width * 0.8)
          ),
          Positioned(
            bottom: 100,
            left: 0,
            right: 0,
            child: Center(
              child: (result != null)
                  ? Text(
                      'Barcode Type: ${describeEnum(result!.format)}   Data: ${result!.code}')
                  : Text(
                      'Scan a code',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
            ),
          )
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((barcode) {
      setState(() {
        this.result = barcode;
        if (barcode.code != '' || barcode.code != null) {
          qrcontroler.CheckQRInfo(barcode.code!);
        }
      });
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
