
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';

class NotificationController extends GetxController {
  String message = "";

  @override
  void onInit() {
    super.onInit();

    FirebaseMessaging.instance.requestPermission();

    FirebaseMessaging.instance.getToken().then((token) {
      print('FCM Token: $token');
    });

    FirebaseMessaging.onMessage.listen((RemoteMessage msg) {
      if (msg.notification != null) {
        message = msg.notification!.body ?? '';
        update(); 
        print(' notifiaction: ${msg.notification!.body}');
      }
    });

    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  }
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print("message in background  : ${message.messageId}");
}
