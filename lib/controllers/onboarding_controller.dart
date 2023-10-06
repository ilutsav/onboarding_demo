import 'package:flutter/material.dart';
import 'package:onboarding_demo/models/onboarding_info.dart';
import 'package:get/state_manager.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:onboarding_demo/views/homepage.dart';
import 'package:get/get.dart';

class OnBoardingController extends GetxController {
  var selectedPageIndex = 0.obs;
  bool get isLastPage => selectedPageIndex.value == onboardingPage.length - 1;
  late PageController pageController;

  OnBoardingController() {
    pageController = PageController();
  }

  forwardAction() {
    if (isLastPage) {
      //go to home page
      Get.to(HomePage());
    } else {
      pageController.nextPage(duration: 300.milliseconds, curve: Curves.ease);
    }
  }

  List<OnBoardingInfo> onboardingPage = [
    OnBoardingInfo('assetss/order.png', 'Order Your Food',
        'Now you can order right from your home.'),
    OnBoardingInfo('assetss/cook.png', 'Cooking Safe Food',
        'We are cooking safe and hygienic food for you.'),
    OnBoardingInfo('assetss/deliver.png', 'Quick Delivery',
        'We will deliver your food at your door step.'),
  ];
}
