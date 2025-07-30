import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:massaclinic/core/class/diohelper.dart';
import 'package:massaclinic/core/class/statusrequest.dart';
import 'package:massaclinic/core/constant/routes.dart';
import 'package:massaclinic/data/model/Login_model.dart';
import 'package:massaclinic/view/screen/link_api.dart';

abstract class ResetpasswordController extends GetxController {
  goToSuccess();
}

class ResetpasswordControllerImp extends ResetpasswordController {
  late TextEditingController password;
  late TextEditingController passwordconfrim;
  String? email;

  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  bool? isshowpassword = true;
  StatusRequest? statusRequest;
  LoginModel? loginModel;
  initialData() {
    email = Get.arguments["email"];
  }

  @override
  void onInit() {
    initialData();
    print(email.toString());
    password = TextEditingController();
    passwordconfrim = TextEditingController();
    super.onInit();
  }

  showpassword() {
    isshowpassword = isshowpassword == true ? false : true;
    update();
  }

  @override
  goToSuccess() {
    if (password.text != passwordconfrim.text) {
      return Get.defaultDialog(
        title: 'Warning',
        middleText: 'Password does not match',
      );
    }
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      DioHelper.postsData(
            url: AppLink.resetpassword,
            data: {
              'email': email,
              'password': password.text,
              'password_confirmation': passwordconfrim.text,
            },
          )
          .then((value) {
            print(value!.data);
            print("email:${email.toString()}");

            if (value.statusCode == 200) {
              loginModel = LoginModel.fromJson(value.data);
              statusRequest = StatusRequest.success;
              Get.snackbar('Congratulations', loginModel!.message!);
              Get.offNamed(AppRoute.successReset);
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

  @override
  void dispose() {
    password.dispose();
    passwordconfrim.dispose();
    super.dispose();
  }
}
