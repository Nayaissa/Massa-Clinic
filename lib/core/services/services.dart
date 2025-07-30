
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyServices extends GetxService {
  late SharedPreferences sharedPreferences;
  Future<MyServices> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
    return this;
  }
}

initalSevices() async {

  // Platform.isAndroid
  //     ? await Firebase.initializeApp(
  //         options: FirebaseOptions(
  //         apiKey: 'AIzaSyAlwhckWwT5bM-1ciVi68wKs44B6l1hAKA',
  //         appId: '1:575584307816:android:458bf4045c6f2065c0c9dd',
  //         messagingSenderId: '575584307816',
  //         projectId: 'ecommerce-93498',
  //         storageBucket: 'ecommerce-93498.firebasestorage.app',
  //       ))
  //     : await Firebase.initializeApp(); 
   await Get.putAsync(() => MyServices().init());
}
