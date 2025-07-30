import 'dart:io';


import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:massaclinic/core/class/diohelper.dart';
import 'package:massaclinic/core/class/statusrequest.dart';
import 'package:massaclinic/core/constant/routes.dart';
import 'package:massaclinic/data/model/Login_model.dart';
import 'package:massaclinic/view/screen/link_api.dart';
import 'package:dio/dio.dart' as dio;
abstract class SignUpController extends GetxController {
  SignUp();
  goToLogin();
  goToVerfiyCodeSignUp();
  pickImage(ImageSource source);
}

class SignUpControllerImp extends SignUpController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  late TextEditingController email;
  late TextEditingController password;
  late TextEditingController userName;
  late TextEditingController phoneNumber;
  List data = [];
  bool? isshowpassword = true;
  LoginModel ?loginModel;

  File? pickedImage;
  final ImagePicker _picker = ImagePicker();

  StatusRequest? statusRequest;
  showpassword() {
    isshowpassword = isshowpassword == true ? false : true;
    update();
  }

  @override
  goToLogin() {
    Get.offNamed(AppRoute.login);
  }

  @override
 @override
SignUp() async {
  var formdata = formstate.currentState;
  if (formdata!.validate()) {
    statusRequest = StatusRequest.loading;
    update();

      try {
       dio.FormData formData = dio.FormData.fromMap({
  "name": userName.text,
  "email": email.text,
  "phonenumber": phoneNumber.text,
  "password": password.text,
  if (pickedImage != null)
    "image": dio.MultipartFile.fromBytes(
      await File(pickedImage!.path).readAsBytes(),
      filename: pickedImage!.path.split('/').last,
    ),
});

        

      final response = await DioHelper.dioClient!.post(AppLink.signup, data: formData);

      print(response.data);
      if (response.statusCode == 200 || response.statusCode ==201) {
        loginModel = LoginModel.fromJson(response.data);
        statusRequest = StatusRequest.success;
        Get.snackbar('Congratulations', loginModel!.message!);
        Get.offNamed(AppRoute.successReset);
      } else {
        loginModel = LoginModel.fromJson(response.data);
        statusRequest = StatusRequest.failure;
        Get.snackbar('Warning', loginModel!.message!);
      }
    } catch (e) {
      print("Error during signup: $e");
      statusRequest = StatusRequest.serverfailure;
    }

    update();
  }
}


  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    userName = TextEditingController();
    phoneNumber = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    phoneNumber.dispose();
    userName.dispose();
    super.dispose();
  }

  @override
  goToVerfiyCodeSignUp() {
    Get.offAllNamed(
      AppRoute.verfiyCodeSignUp,
      arguments: {"email": email.text},
    );
  }

 

  @override
  void pickImage(source) async {
    final pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      pickedImage = File(pickedFile.path);
      update();
    }
  }
}
