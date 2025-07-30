import 'package:get/get.dart';
import 'package:massaclinic/core/class/diohelper.dart';
import 'package:massaclinic/core/class/statusrequest.dart';
import 'package:massaclinic/data/model/complaint_model.dart';

abstract class ComlaintController extends GetxController {}

class ComlaintControllerImp extends ComlaintController {
  StatusRequest? complaintStatusRequest;
  StatusRequest? deleteStatusRequest;

  ComplaintModel? complaintModel;

  @override
  void onInit() {
    showComplaints();
    super.onInit();
  }

  showComplaints() {
    complaintStatusRequest = StatusRequest.loading;
    update();

    DioHelper.getDataa(url: '/api/complaints')
        .then((value) {
          print(value!.data);
          if (value.statusCode == 200) {
            print('naayayayya');

            complaintStatusRequest = StatusRequest.success;

            complaintModel = ComplaintModel.fromJson(value.data);
            print('2--');

            if (complaintModel!.data!.isEmpty || complaintModel!.data == null) {
              complaintStatusRequest = StatusRequest.noData;
            }
            update();
          } else {
            complaintStatusRequest = StatusRequest.noData;
          }
          update();
        })
        .catchError((error) {
          print(error.toString());
          complaintStatusRequest = StatusRequest.serverfailure;
          update();
        });
  }

  deleteComplaints(String id) {
    deleteStatusRequest = StatusRequest.loading;
    update();

    DioHelper.deleteData(url: '/api/DeleteComplaint/$id', data: {})
        .then((value) {
          print(value!.data);
          if (value.statusCode == 200) {
            deleteStatusRequest = StatusRequest.success;
            complaintModel = ComplaintModel.fromJson(value.data);
            showComplaints();
            update();
          } else {
            deleteStatusRequest = StatusRequest.noData;
          }
          update();
        })
        .catchError((error) {
          print(error.toString());
          complaintStatusRequest = StatusRequest.serverfailure;
          update();
        });
  }
}
