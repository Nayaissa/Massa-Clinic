import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:massaclinic/bindings/initalbindings.dart';
import 'package:massaclinic/core/class/diohelper.dart';
import 'package:massaclinic/core/localization/localChange.dart';
import 'package:massaclinic/core/localization/translation.dart';
import 'package:massaclinic/core/services/services.dart';
import 'package:massaclinic/routes.dart';
// import 'package:massaclinic/view/screen/notification_screen.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initalSevices();
await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
 await FirebaseMessaging.instance.requestPermission(
    alert: true,
    badge: true,
    sound: true,
  );
  DioHelper.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    LocalController controller = Get.put(LocalController());

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      locale: controller.language,
      translations: MyTranslation(), 
      
  // locale: controller.language ?? Locale('en'),
  fallbackLocale: Locale('en'),   
      theme: controller.appTheme,
      initialBinding: InitialBinding(),
    //  home: SplashScreen(),
      getPages: getPages,
    );
  }
}
