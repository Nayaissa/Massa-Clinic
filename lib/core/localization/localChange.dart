import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:massaclinic/core/constant/AppTheme.dart';
import 'package:massaclinic/core/services/services.dart';

class LocalController extends GetxController {
  Locale? language;
  ThemeData appTheme = themeEnglish;
  MyServices myServices = Get.find();
  changeLange(String langCode) {
    Locale locale = Locale(langCode);
    myServices.sharedPreferences.setString('lang', langCode);
    appTheme = langCode == 'ar' ? themeArabic : themeEnglish;
    Get.changeTheme(appTheme);
    Get.updateLocale(locale);
  }

  @override
  void onInit() {
    super.onInit();
    String? sharedPerLang = myServices.sharedPreferences.getString('lang');
    if (sharedPerLang == "ar") {
      language = const Locale("ar");
      appTheme = themeArabic;
    } else if (sharedPerLang == "en") {
      language = const Locale("en");
      appTheme = themeEnglish;
    } else {
      language = Locale(Get.deviceLocale!.languageCode);

      appTheme = themeEnglish;
    }
  }
}
