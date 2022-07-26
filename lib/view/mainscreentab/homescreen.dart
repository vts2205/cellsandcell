import 'package:carousel_slider/carousel_slider.dart';
import 'package:cellsandcell/constants/color.dart';
import 'package:cellsandcell/controller/profilecontroller.dart';
import 'package:cellsandcell/model/offers_images.dart';
import 'package:cellsandcell/model/product_images.dart';
import 'package:cellsandcell/service/APIService.dart';
import 'package:cellsandcell/view/loginscreen.dart';
import 'package:cellsandcell/view/mainscreentab/profilescreen.dart';
import 'package:cellsandcell/view/mobilenumberscreen.dart';
import 'package:cellsandcell/view/scanqrscreen.dart';
import 'package:cellsandcell/view/viewqrscreen.dart';
import 'package:cellsandcell/view/walletscreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ProductImageModel? productImageModel;

  var isLoading = false;

  @override
  void initState() {
    super.initState();
    getProductData();
    getOfferData();
  }

  getProductData() async {
    productImageModel = (await APIService().productImage())!;
    if (productImageModel != null) {
      setState(() {
        isLoading = true;
      });
    }
  }

  OfferImageModel? offerImageModel;

  getOfferData() async {
    offerImageModel = (await APIService().offerImage())!;
    if (offerImageModel != null) {
      setState(() {
        isLoading = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: pale,
        body: Column(
          children: [
            const SizedBox(height: 20),
            CarouselSlider.builder(
                itemCount: productImageModel?.data?.allProducts?.length,
                itemBuilder: (context, index, realIndex) {
                  final image =
                      '${productImageModel?.data?.allProducts![index].image ?? ''}';
                  return buildCarouselImage(image, index);
                },
                options: CarouselOptions(
                    viewportFraction: 1,
                    height: MediaQuery.of(context).size.height * 0.30,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 2))),
            const SizedBox(height: 10),
            CarouselSlider.builder(
                itemCount: offerImageModel?.data?.offers?.length,
                itemBuilder: (context, index, realIndex) {
                  final offer =
                      '${offerImageModel?.data?.offers?[index].image ?? ''}';
                  return buildOffersImage(offer, index);
                },
                options: CarouselOptions(
                    viewportFraction: 1,
                    height: MediaQuery.of(context).size.height * 0.20,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 2))),
            const SizedBox(height: 10),
            Card(
              margin: const EdgeInsets.all(10),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Transfer Money',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            buildScanQRContainer(),
                            const Text(
                              'Scan QR\nTo Pay',
                              style: TextStyle(fontSize: 14),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            buildViewQRContainer(),
                            const Text(
                              'Show QR\nTo Pay',
                              style: TextStyle(fontSize: 14),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            buildMobileNumberContainer(),
                            const Text(
                              'To Mobile\nNumber',
                              style: TextStyle(fontSize: 14),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            buildWalletContainer(),
                            const Text(
                              'Wallet\nHistory',
                              style: TextStyle(fontSize: 14),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ));
  }

  buildCarouselImage(String image, int index) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: Image.network(
          image,
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  buildOffersImage(String offer, int index) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: Image.network(
          offer,
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  buildWalletContainer() {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: purple,
      ),
      child: IconButton(
        onPressed: () {
          Get.to(WalletScreen());
        },
        icon: const Icon(Icons.account_balance_rounded),
        iconSize: 30,
        color: Colors.white,
      ),
    );
  }

  buildMobileNumberContainer() {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: purple,
      ),
      child: IconButton(
        onPressed: () {
          Get.to(const MobileNumberScreen());
        },
        icon: const Icon(Icons.account_circle_rounded),
        iconSize: 30,
        color: Colors.white,
      ),
    );
  }

  buildViewQRContainer() {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: purple,
      ),
      child: IconButton(
        onPressed: () {
          Get.to(const ViewQrScreen(), arguments: [
            LoginScreen().username.text,
            ProfileController().namecontroller.text
          ]);
          print(LoginScreen().username);
        },
        icon: const Icon(Icons.qr_code_2_rounded),
        iconSize: 30,
        color: Colors.white,
      ),
    );
  }

  buildScanQRContainer() {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: purple,
      ),
      child: IconButton(
        onPressed: () {
          Get.to(const ScanQrScreen());
        },
        icon: const Icon(Icons.qr_code_scanner_rounded),
        iconSize: 30,
        color: Colors.white,
      ),
    );
  }
}
