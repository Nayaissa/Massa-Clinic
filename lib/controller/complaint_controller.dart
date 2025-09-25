import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:massaclinic/core/class/diohelper.dart';
import 'package:massaclinic/core/class/statusrequest.dart';
import 'package:massaclinic/data/model/complaint_model.dart';

abstract class ComlaintController extends GetxController {}

class ComlaintControllerImp extends ComlaintController {
  StatusRequest? complaintStatusRequest;
  StatusRequest? deleteStatusRequest;
  StatusRequest? addStatusRequest;

  TextEditingController? descriptionController;

  ComplaintModel? complaintModel;

  @override
  void onInit() {
    descriptionController = TextEditingController();
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

  addComplaints() {
    addStatusRequest = StatusRequest.loading;
    update();

    DioHelper.postsData(
          url: '/api/SubmitComplaint',
          data: {},
          query: {'content': descriptionController!.text},
        )
        .then((value) {
          print(value!.data);
          if (value.statusCode == 200 || value.statusCode == 201) {
            addStatusRequest = StatusRequest.success;
            descriptionController!.clear();
            showComplaints();
            Get.back();
            update();
          } else {
            addStatusRequest = StatusRequest.noData;
          }
          update();
        })
        .catchError((error) {
          addStatusRequest = StatusRequest.serverfailure;
          update();
        });
  }
  
  editComplaint(String id, String newContent) {
    addStatusRequest = StatusRequest.loading;
    update();

    DioHelper.putData(
          url: '/api/EditComplaint/$id',
          query: {'content': newContent},
          data: {},
        )
        .then((value) {
          if (value!.statusCode == 200) {
            addStatusRequest = StatusRequest.success;
            showComplaints();
            update();
            Get.snackbar("Success", "Complaint updated successfully");
          } else {
            addStatusRequest = StatusRequest.noData;
            Get.snackbar("Error", "Failed to update complaint");
          }
        })
        .catchError((error) {
          addStatusRequest = StatusRequest.serverfailure;
          update();
          Get.snackbar("Error", error.toString());
        });
  }
}
