import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:massaclinic/core/class/diohelper.dart';
import 'package:massaclinic/core/class/statusrequest.dart';
import 'package:massaclinic/core/constant/routes.dart';
import 'package:massaclinic/core/services/services.dart';
import 'package:massaclinic/data/datasource/remote/auth/login_data.dart';
import 'package:massaclinic/data/model/Login_model.dart';
import 'package:massaclinic/view/screen/link_api.dart';

String? token;

abstract class LoginController extends GetxController {
  login();
  goToSignUp();
  goToForegetPassword();
}

class LoginControllerImp extends LoginController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late TextEditingController email;
  late TextEditingController password;
  bool? isshowpassword = true;
  MyServices myServices = Get.find();
  StatusRequest? statusRequest;
  LoginData loginData = LoginData(Get.find());
  LoginModel? loginModel;
  showpassword() {
    isshowpassword = isshowpassword == true ? false : true;
    update();
  }

  @override
  goToSignUp() {
    Get.offAllNamed(AppRoute.signUp);
  }

  @override
  login() async {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      DioHelper.postsData(
            url: AppLink.login,
            data: {'email': email.text, 'password': password.text},
          )
          .then((value) {
            
            print(value!.data);
            if (value.statusCode == 200) {
              loginModel = LoginModel.fromJson(value.data);
              myServices.sharedPreferences.setString(
                'userid',
                loginModel!.yourAccount!.id.toString(),
              );
              myServices.sharedPreferences.setString(
                'username',
                loginModel!.yourAccount!.email!,
              );
              myServices.sharedPreferences.setString(
                'token',
                loginModel!.token!,
              );
              myServices.sharedPreferences.setString(
                'imageurl',
                loginModel?.imageUrl ?? 'https://plus.unsplash.com/premium_photo-1690407617542-2f210cf20d7e?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cGVyc29ufGVufDB8fDB8fHww',
              );
              myServices.sharedPreferences.setString('step', '2');
              statusRequest = StatusRequest.success;
              token = myServices.sharedPreferences.getString('token');
              print('naya =$token');
              Get.snackbar('Congratulations', loginModel!.message!);
              Get.offNamed(AppRoute.homepage);
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

  @override
  void onInit() {
    // FirebaseMessaging.instance.getToken().then((value) {
    //   print(value);
    //   String? token = value;
    // });

    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  goToForegetPassword() {
    Get.toNamed(AppRoute.forgetPassword);
  }
}
