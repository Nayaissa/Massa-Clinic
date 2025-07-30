import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:massaclinic/core/class/diohelper.dart';
import 'package:massaclinic/core/class/statusrequest.dart';
import 'package:massaclinic/core/constant/routes.dart';
import 'package:massaclinic/data/model/Login_model.dart';
import 'package:massaclinic/view/screen/link_api.dart';

abstract class VerfiyCodeController extends GetxController {
  goToResert(String code);
}

class VerfiyCodeControllerImp extends VerfiyCodeController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  StatusRequest? statusRequest;
  String? code;
  LoginModel? loginModel;
  String? email;

  initialData() {
    email = Get.arguments["email"];
  }

  @override
  void onInit() {
    initialData();
    super.onInit();
  }

  @override
  goToResert(code) {
    statusRequest = StatusRequest.loading;
    update();
    DioHelper.postsData(
          url: AppLink.verifycode,
          data: {'code': code.toString(),'email':email
          },
        )
        .then((value) {
          print(value!.data);
          if (value.statusCode == 200) {
            loginModel = LoginModel.fromJson(value.data);
            statusRequest = StatusRequest.success;
            Get.snackbar('Congragtions', loginModel!.message!);
            Get.offNamed(AppRoute.resetPassword,arguments: {
              "email": email
            });
            update();

          } else {
            loginModel = LoginModel.fromJson(value.data);
            Get.snackbar('Warning', loginModel!.message!);
            statusRequest = StatusRequest.failure;
            update();
          }
        })
        .catchError((error) {
          print(error.toString());
          statusRequest = StatusRequest.serverfailure;
          update();
        });

    update();
  }
}

    // Get.offNamed(AppRoute.resetPassword);
 