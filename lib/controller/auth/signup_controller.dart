import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:massaclinic/core/class/diohelper.dart';
import 'package:massaclinic/core/class/statusrequest.dart';
import 'package:massaclinic/core/constant/routes.dart';
import 'package:massaclinic/data/model/Login_model.dart';
import 'package:massaclinic/data/model/register_model.dart';
import 'package:dio/dio.dart' as dio;

abstract class SignUpController extends GetxController {
  SignUp();
  goToLogin();
  goToVerfiyCodeSignUp();
  pickImage(ImageSource source);
}

class SignUpControllerImp extends SignUpController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late int age = 18;

  late TextEditingController email;
  late TextEditingController password;
  late TextEditingController userName;
  late TextEditingController phoneNumber;
  late TextEditingController addressController;

  List data = [];
  bool? isshowpassword = true;
  LoginModel? loginModel;
  RegisterModel? registerModel;
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

  String? selectedLocation;

  List<String> locations = [
    "jaramana",
    "Damascus",
    "Aleppo",
    "Homs",
    "Latakia",
    "Hama",
    "Tartous",
    "Daraa",
    "Deir ez-Zor",
  ];

  void setLocation(String? value) {
    selectedLocation = value;
    addressController.text = value ?? "";
    update();
  }

  @override
  @override
SignUp() async {
  var formdata = formstate.currentState;
  if (formdata!.validate()) {
    statusRequest = StatusRequest.loading;
    update();

    try {
      // بناء الفورم داتا
      dio.FormData formData = dio.FormData.fromMap({
        "name": userName.text.trim(),
        "email": email.text.trim(),
        "phonenumber": phoneNumber.text.trim(),
        "password": password.text.trim(),
        "age": age.toString(),
        "location": selectedLocation ?? "",
        if (pickedImage != null)
          "image": await dio.MultipartFile.fromFile(
            pickedImage!.path,
            filename: pickedImage!.path.split('/').last,
          ),
      });

      final response = await DioHelper.dioClient!.post(
        'http://10.0.2.2:8000/api/register-user',
        data: formData,
        options: dio.Options(
          headers: {
            "Accept": "application/json",
            // لا تحدد Content-Type، Dio يضيفه تلقائياً مع boundary
          },
          validateStatus: (status) => true, // عشان ما يرمي استثناء
        ),
      );

      print("🔵 Status: ${response.statusCode}");
      print("🔵 Data: ${response.data}");

      if (response.statusCode == 200 || response.statusCode == 201) {
        loginModel = LoginModel.fromJson(response.data);
        statusRequest = StatusRequest.success;
        Get.snackbar('Congratulations', loginModel!.message!);
        Get.offNamed(AppRoute.successReset);
      } else {
        registerModel = RegisterModel.fromJson(response.data);
        statusRequest = StatusRequest.failure;
        Get.snackbar('Warning', registerModel!.message ?? "Unknown error");
      }
    } catch (e) {
      print("❌ Error during signup: $e");
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
    addressController = TextEditingController();
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

  void increaseAge() {
    age++;
    update();
  }

  void decreaseAge() {
    if (age > 0) age--;
    update();
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
