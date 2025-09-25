import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:massaclinic/core/class/diohelper.dart';
import 'package:massaclinic/core/class/statusrequest.dart';
import 'package:massaclinic/core/constant/routes.dart';
import 'package:massaclinic/data/model/Login_model.dart';

abstract class ChangePasswordController extends GetxController {
  changePassword();
}

class ChangePasswordControllerImp extends ChangePasswordController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  late TextEditingController oldPassword;
  late TextEditingController password;
  late TextEditingController confirmPassword;

  StatusRequest? statusRequest;
  LoginModel? loginModel;
  bool? isshowpassword = true;
showpassword() {
    isshowpassword = isshowpassword == true ? false : true;
    update();
  }
  @override
  changePassword() {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      if (password.text != confirmPassword.text) {
        Get.snackbar("Error", "Passwords do not match");
        return;
      }

      statusRequest = StatusRequest.loading;
      update();

      DioHelper.postsData(url: '/api/change-password', data: {
        "current_password": oldPassword.text,
        "new_password": password.text,
        "new_password_confirmation": confirmPassword.text,
      }).then((value) {
        print(value!.data);
        if (value.statusCode == 200) {
          loginModel = LoginModel.fromJson(value.data);
          statusRequest = StatusRequest.success;
          Get.snackbar("Success", loginModel!.message ?? "Password updated");
          Get.offAllNamed(AppRoute.login); 
          update();
        } else {
          loginModel = LoginModel.fromJson(value.data);
          Get.snackbar("Warning", loginModel!.message ?? "Error occurred");
          statusRequest = StatusRequest.failure;
          update();
        }
      }).catchError((error) {
        print(error.toString());
        statusRequest = StatusRequest.serverfailure;
        update();
      });
    }
  }

  @override
  void onInit() {
    oldPassword = TextEditingController();
    password = TextEditingController();
    confirmPassword = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    oldPassword.dispose();
    password.dispose();
    confirmPassword.dispose();
    super.dispose();
  }
}
