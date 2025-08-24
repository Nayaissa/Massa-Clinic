import 'package:get/get.dart';
import 'package:massaclinic/core/class/diohelper.dart';
import 'package:massaclinic/core/class/statusrequest.dart';
import 'package:massaclinic/data/model/archive_model.dart';
import 'package:massaclinic/data/model/session_model.dart';

abstract class ArchiveController extends GetxController {
  showArchive();
}

class ArchiveControllerImp extends ArchiveController {
  StatusRequest? statusRequest;
  StatusRequest? seesionStatusRequest;
  ArchiveModdel? archiveModdel;
  SessionModel? sessionModel;
  @override
  void onInit() {
    showArchive();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  @override
  showArchive() {
    statusRequest = StatusRequest.loading;
    update();

    DioHelper.getDataa(url: '/api/user/services/archive')
        .then((value) {
          print(value!.data);
          if (value.statusCode == 200) {
            statusRequest = StatusRequest.success;
            archiveModdel = ArchiveModdel.fromJson(value.data);

            if (archiveModdel!.data!.isEmpty || archiveModdel!.data == null) {
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

  getSession(String id) {
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
