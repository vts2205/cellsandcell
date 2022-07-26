import 'package:cellsandcell/constants/commonfunction.dart';
import 'package:cellsandcell/model/profile_edit.dart';
import 'package:cellsandcell/model/profileview.dart';
import 'package:cellsandcell/service/APIService.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class ProfileController extends GetxController {
  var ProfileInfo = <ProfileModel>[].obs;
  var ProfileEditInfo = <ProfileEdit>[].obs;
  var isLoading = true.obs;
  TextEditingController namecontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();
  TextEditingController addresscontroller = TextEditingController();
  TextEditingController citycontroller = TextEditingController();
  TextEditingController districtcontroller = TextEditingController();
  TextEditingController pincodecontroller = TextEditingController();
  var profileImg = ''.obs;

  @override
  void onInit() {
    FetchProfileInfo();
    //  Get.put(ProfileEditController()).FetchProfileEditInfo();
    FetchProfileEditInfo();
    getcameraacess();

    super.onInit();
  }

  void getcameraacess() async {
    cameraPermision();
  }

  Future cameraPermision() async {
    var status = await Permission.camera.status;

    if (status.isGranted == false) {
      PermissionStatus? status = await Permission.camera.status;
      if (status.isGranted == false) {
        Get.back();
        var statuses = await [Permission.camera].request();
        status = statuses[Permission.camera];
        commonfunction.camerapermissionstatus = status.toString();
      } else if (status.isGranted == true) {
        commonfunction.camerapermissionstatus = 'PermissionStatus.granted';
      }
    }
  }

  void FetchProfileInfo() async {
    try {
      isLoading(true);
      var profileInfo = await APIService().FetchProfile();
      if (profileInfo != null) {
        ProfileInfo.assign(profileInfo);

        namecontroller.text = ProfileInfo[0].name!;
        // addresscontroller.text = ProfileInfo[0].;
        phonecontroller.text = ProfileInfo[0].phone!;
      } else {
        return null;
      }
    } finally {
      isLoading(false);
    }
  }

  void FetchProfileEditInfo() async {
    try {
      isLoading(true);
      var profileEditInfo = await APIService().FetchProfileEdit();
      if (profileEditInfo != null) {
        ProfileEditInfo.assign(profileEditInfo);
        addresscontroller.text = profileEditInfo.profileEdit[0].address ?? '';
        profileImg.value = profileEditInfo.profileEdit[0].image;
        // namecontroller.text = profileEditInfo[0].name!;
        // // addresscontroller.text = ProfileInfo[0].;
        // phonecontroller.text = profileEditInfo[0].phone!;
      }
      return null;
    } finally {
      isLoading(false);
    }
  }

  void FetchProfileUpdate() async {
    try {
      isLoading(true);
      var profileEditInfo = await APIService()
          .ProfileUpdate(namecontroller.text, phonecontroller.text);
      if (profileEditInfo != null) {
        ProfileEditInfo.assign(profileEditInfo);
        addresscontroller.text = profileEditInfo.profileEdit[0].address ?? '';
        districtcontroller.text = profileEditInfo.profileEdit[0].address ?? '';
        pincodecontroller.text = profileEditInfo.profileEdit[0].address ?? '';
        profileImg.value = profileEditInfo.profileEdit[0].image;
        // namecontroller.text = profileEditInfo[0].name!;
        // // addresscontroller.text = ProfileInfo[0].;
        // phonecontroller.text = profileEditInfo[0].phone!;
      }
      return null;
    } finally {
      isLoading(false);
    }
  }
}
