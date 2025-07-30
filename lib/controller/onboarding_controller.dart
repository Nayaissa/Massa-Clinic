import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:massaclinic/core/constant/routes.dart';
import 'package:massaclinic/core/services/services.dart';
import 'package:massaclinic/data/datasource/static/static.dart';

abstract class OnBoardingController extends GetxController {
  next();
  onPageChange(int index);
  skip(); 
}

class OnBoardingControllerImp extends OnBoardingController {
  late PageController pageController;
  MyServices myServices = Get.find();
  int currentIndex = 0;

  @override
  next() {
    currentIndex++;

    if (currentIndex > onboardingList.length - 1) {
      myServices.sharedPreferences.setString('onboarding', '1');
      Get.offAllNamed(AppRoute.login);
    } else {
      pageController.animateToPage(
        currentIndex,
        duration: Duration(milliseconds: 900),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  skip() {
    myServices.sharedPreferences.setString('onboarding', '1');
    Get.offAllNamed(AppRoute.login);
  }

  @override
  onPageChange(int index) {
    currentIndex = index;
    update();
  }

  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }
}
