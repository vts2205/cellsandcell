import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommonFunctions {
  var camerapermissionstatus = '';

  dynamic toast(String text, color) async {
    Get.snackbar('Happzee', text,
        backgroundColor: color,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(milliseconds: 1500));
  }
}

var commonfunction = CommonFunctions();
