import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:massaclinic/controller/onboarding_controller.dart';
import 'package:massaclinic/core/constant/AppColor.dart';
import 'package:massaclinic/view/widget/onBoarding/CustomButton.dart';
import 'package:massaclinic/view/widget/onBoarding/CustomSlider.dart';
import 'package:massaclinic/view/widget/onBoarding/DotOnBoarding.dart';

// class OnBoarding extends StatelessWidget {
//   const OnBoarding({super.key});

//   @override
//   Widget build(BuildContext context) {
//     Get.put(OnBoardingControllerImp());
//     return const SafeArea(
//         child: Scaffold(
//       body: Column(
//         children: [
//           Expanded(
//             flex: 3,
//             child: CustomSliderOnBoarding(),
//           ),

//           Expanded(
//             flex: 1,
//             child: Column(
//               children: [
//                 DotOnBoarding(),
//                   Spacer(),
//                 CustomButtonOnBoarding(),
//               ],
//             ),
//           )
//         ],
//       ),
//     ));
//   }
// } وجود
class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingControllerImp());

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              height: 600,
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColor.secondaryColor,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(80),
                ),
              ),
              child: Align(
                alignment: Alignment.topRight,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                                        mainAxisAlignment: MainAxisAlignment.end,

                      children: [
                        TextButton(
                          onPressed: () {
                            controller.skip();
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 15,vertical: 3),
                            decoration: BoxDecoration(
                              color: AppColor.primaryColor.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(10),

                            ),
                            child: const Text(
                              "Skip",
                              style: TextStyle(
                                color: AppColor.backgroundColor,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                     Expanded(
                       flex: 3,
                      child: CustomSliderOnBoarding()),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                children: const [
                  SizedBox(height: 10,),
                  DotOnBoarding(),
                  Spacer(),
                  CustomButtonOnBoarding(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
