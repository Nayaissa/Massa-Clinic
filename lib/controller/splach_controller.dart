import 'package:get/get.dart';
import 'package:massaclinic/core/constant/routes.dart';
import 'package:massaclinic/core/services/services.dart';

class SplashController extends GetxController {
  final MyServices myServices = Get.find();

  var opacity = 0.0.obs; 

  @override
  void onInit() {
    super.onInit();

    
    Future.delayed(const Duration(milliseconds: 200), () {
      opacity.value = 1.0;
    });

    
    Future.delayed(const Duration(seconds: 4), () {
      _goNext();
    });
  }

  void _goNext() {
    String? step = myServices.sharedPreferences.getString("step");

    if (step == "2") {
      Get.offAllNamed(AppRoute.homepage);
    } else if (step == "1") {
      Get.offAllNamed(AppRoute.login);
    } else {
      Get.offAllNamed(AppRoute.onBoarding);
    }
  }
}
