import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:massaclinic/bindings/initalbindings.dart';
import 'package:massaclinic/core/class/diohelper.dart';
import 'package:massaclinic/core/localization/localChange.dart';
import 'package:massaclinic/core/services/services.dart';
import 'package:massaclinic/routes.dart';
import 'package:massaclinic/view/screen/text.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initalSevices();
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
      theme: controller.appTheme,
      initialBinding: InitialBinding(),
  home: EditProfileScreen(),
      getPages: getPages,
    );
  }
}
