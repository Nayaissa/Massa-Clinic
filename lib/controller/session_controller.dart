import 'package:get/get.dart';
import 'package:massaclinic/core/class/diohelper.dart';
import 'package:massaclinic/core/class/statusrequest.dart';
import 'package:massaclinic/data/model/session_model.dart';

abstract class SessionController extends GetxController {
  getSession(String id );
}

class SessionControllerImp extends SessionController {
  StatusRequest? seesionStatusRequest;
  SessionModel? sessionModel;
  String? id;
  @override
  void onInit() {
    var data = Get.arguments;
    id = data['id'];
    getSession(id!);
    super.onInit();
  }

  @override
  getSession(id) {
    seesionStatusRequest = StatusRequest.loading;
    update();

    DioHelper.getDataa(url: '/api/services/$id/sessions')
        .then((value) {
          print(value!.data);
          if (value.statusCode == 200) {
            seesionStatusRequest = StatusRequest.success;
            sessionModel = SessionModel.fromJson(value.data);

            if (sessionModel!.sessions!.isEmpty) {
              seesionStatusRequest = StatusRequest.noData;
            }
            update();
          } else {
            seesionStatusRequest = StatusRequest.noData;
          }
          update();
        })
        .catchError((error) {
          print(error.toString());
          seesionStatusRequest = StatusRequest.serverfailure;
          update();
        });
  }
}
