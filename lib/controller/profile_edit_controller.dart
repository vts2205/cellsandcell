import 'package:cellsandcell/model/profile_edit.dart';
import 'package:cellsandcell/service/APIService.dart';
import 'package:get/get.dart';

class ProfileEditController extends GetxController {
  var ProfileEditInfo = <ProfileEdit>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    FetchProfileEditInfo();
    super.onInit();
  }

  void FetchProfileEditInfo() async {
    try {
      isLoading(true);
      var profileEditInfo = await APIService().FetchProfileEdit();
      if (profileEditInfo != null) {
        ProfileEditInfo.assign(profileEditInfo);
      }
      return null;
    } finally {
      isLoading(false);
    }
  }
}
