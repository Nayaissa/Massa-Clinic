import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:massaclinic/controller/splach_controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SplashController());

    return Scaffold(
      body: Obx(
        () => AnimatedOpacity(
          opacity: controller.opacity.value,
          duration: const Duration(seconds: 2),
          child: SizedBox.expand(
            child: Image.asset(
              "assets/images/Splash.png",
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
