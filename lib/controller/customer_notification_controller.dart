import 'package:get/get.dart';
import 'package:massaclinic/core/class/diohelper.dart';
import 'package:massaclinic/core/class/statusrequest.dart';
import 'package:massaclinic/data/model/notification_model.dart';

class CustomerNotificationController extends GetxController {
  List notifications = [];
  StatusRequest? statusRequest;
  NotificationModel? notificationModel;
  @override
  void onInit() {
    super.onInit();
    getNotifications();
  }

  Future<void> getNotifications() async {
    statusRequest = StatusRequest.loading;
    update();

    await DioHelper.getDataa(url: "/api/customer-notifications")
        .then((value) {
          print(value!.data);
          if (value.statusCode == 200) {
            statusRequest = StatusRequest.success;
            notificationModel = NotificationModel.fromJson(value.data);

            if (notificationModel!.data!.isEmpty) {
              statusRequest = StatusRequest.noData;
            }
            update();
          } else {
            statusRequest = StatusRequest.noData;
          }
          update();
        })
        .catchError((error) {
          print(error.toString());
          statusRequest = StatusRequest.serverfailure;
          update();
        });
  }
}
