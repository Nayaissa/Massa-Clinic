import 'package:get/get.dart';
import 'package:massaclinic/controller/notification_controller.dart';
import 'package:massaclinic/core/class/diohelper.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(DioHelper());
    Get.put(NotificationController());

  }
}
