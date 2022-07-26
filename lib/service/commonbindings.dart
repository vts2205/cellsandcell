import 'package:get/get.dart';
import '../controller/walletamountcontroller.dart';

class Commonbindings implements Bindings {
  @override
  void dependencies() {
    Get.put(WalletController(), permanent: true);
  }
}
