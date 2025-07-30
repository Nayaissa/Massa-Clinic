import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:massaclinic/core/class/diohelper.dart';
import 'package:massaclinic/core/class/statusrequest.dart';
import 'package:massaclinic/core/constant/routes.dart';
import 'package:massaclinic/data/model/Login_model.dart';
import 'package:massaclinic/view/screen/link_api.dart';

abstract class ForgetpasswordController extends GetxController {
  goToVerfiactionCode();
}

class ForgetpasswordControllerImp extends ForgetpasswordController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  late TextEditingController email;
  StatusRequest? statusRequest;
  LoginModel? loginModel;
  @override
  goToVerfiactionCode() {
    {
      var formdata = formstate.currentState;
      if (formdata!.validate()) {
        statusRequest = StatusRequest.loading;
        update();
        DioHelper.postsData(url: AppLink.sentcode, data: {'email': email.text})
            .then((value) {
              print(value!.data);
              if (value.statusCode == 200) {
                loginModel = LoginModel.fromJson(value.data);
                statusRequest = StatusRequest.success;
                Get.snackbar('Congragtions', loginModel!.message!);
                Get.offNamed(
                  AppRoute.verfiyCode,
                  arguments: {"email": email.text},
                );
                print(email);
                update();

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
  }

  @override
  void onInit() {
    email = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }
}
