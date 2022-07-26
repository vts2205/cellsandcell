import 'package:cellsandcell/model/onboarding_info.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingController extends GetxController {
  var selectedpageIndex = 0.obs;
  bool get isLastPage => selectedpageIndex.value == onboardingPages.length - 1;
  var pageController = PageController();

  ForwardAction() {
    if (isLastPage) {
    } else {
      pageController.nextPage(duration: 300.milliseconds, curve: Curves.ease);
    }
  }

  List<OnboardingInfo> onboardingPages = [
    OnboardingInfo(
        'assets/images/introimg1.png', 'Welcome to Cell\'s and Cell', ''),
    OnboardingInfo('assets/images/introimg2.png', 'Join with Us',
        'Let\'s join together to become digitalized'),
    OnboardingInfo('assets/images/introimg3.png', 'Earn Money',
        'Make money digitally by buying accessories from us'),
    OnboardingInfo('assets/images/introimg4.png', 'Share Money',
        'Share your money to your friends and buy a product using that')
  ];
}
