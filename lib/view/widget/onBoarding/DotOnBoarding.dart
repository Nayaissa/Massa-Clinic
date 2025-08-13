import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:massaclinic/controller/onboarding_controller.dart';
import 'package:massaclinic/core/constant/AppColor.dart';
import 'package:massaclinic/data/datasource/static/static.dart';


class DotOnBoarding extends StatelessWidget {
  const DotOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoardingControllerImp>(
      builder: (controller) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ...List.generate(
            onboardingList.length,
            (index) => AnimatedContainer(
              margin: const EdgeInsets.all(3),
              duration: const Duration(milliseconds: 900),
              width: controller.currentIndex == index ? 20 : 6,
              height: 6,
              decoration: BoxDecoration(
                color: AppColor.primaryColor,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          )
        ],
      ),
    );
  }
}