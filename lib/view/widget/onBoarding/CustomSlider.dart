import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:massaclinic/controller/onboarding_controller.dart';
import 'package:massaclinic/data/datasource/static/static.dart';

// class CustomSliderOnBoarding extends GetView<OnBoardingControllerImp> {
//   const CustomSliderOnBoarding({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return PageView.builder(
//       controller: controller.pageController,
//       onPageChanged: (value) {
//         controller.onPageChange(value);
//       },
//       itemBuilder: (context, index) => Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           children: [
//             const SizedBox(
//               height: 50,
//             ),
//              Text(
//               onboardingList[index].title!,
//               textAlign: TextAlign.center,
//               style:Theme.of(context).textTheme.displayLarge
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//             Container(
//                 padding: const EdgeInsets.all(10),
//                 width: double.infinity,
//                 height: 102,
//                 alignment: Alignment.center,
//                 child: Text(
//                   onboardingList[index].body!,
//                   textAlign: TextAlign.center,
//                   style:Theme.of(context).textTheme.bodyLarge
//                 )),
//             const SizedBox(
//               height: 30,
//             ),
          
//                  Image.asset(
//               onboardingList[index].image!,
//               height: 270,
//               width: 300,
//               fit: BoxFit.fill,
//             ),
//           ],
//         ),
//       ),
//       itemCount: onboardingList.length,
//     );
//   }
// }
class CustomSliderOnBoarding extends GetView<OnBoardingControllerImp> {
  const CustomSliderOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller.pageController,
      onPageChanged: (value) {
        controller.onPageChange(value);
      },
      itemCount: onboardingList.length,
      itemBuilder: (context, index) => Expanded(  
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 15),
      
         
             Image.asset(
                onboardingList[index].image!,
                height: 250,
                width: 250,
                fit: BoxFit.fill,
              ),
            
      
             const SizedBox(height: 20),
      
            Text(
              onboardingList[index].title!,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.displayLarge?.copyWith(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                       fontFamily: 'PoetsenOne',
                    color: Colors.black87,
                  ),
            ),
      
            const SizedBox(height: 20),
      
            Text(
              onboardingList[index].body!,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontSize: 16,
                    fontFamily: 'PoetsenOne',
                    color: Colors.black54,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
