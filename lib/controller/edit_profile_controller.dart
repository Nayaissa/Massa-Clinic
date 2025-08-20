import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:massaclinic/controller/profile_controller.dart';
import 'package:massaclinic/core/class/diohelper.dart';
import 'package:massaclinic/core/class/statusrequest.dart';
import 'package:massaclinic/view/screen/profile/edit_profile.dart';
import 'package:dio/dio.dart' as dio;

abstract class EditProfileController extends GetxController {
  saveChanges(
    String name,
    String email,
    String number,
    String image,
    String age,
    String address,
  );
}

class EditProfileControllerImp extends EditProfileController {
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController numberController;
  late TextEditingController addressController;
  late int age;
  String? image;
  EditProfile? editProfile;
  StatusRequest? statusRequest;
  File? pickedImage;
  final ImagePicker _picker = ImagePicker();

  @override
  void onInit() {
    super.onInit();
    var data = Get.arguments;

    nameController = TextEditingController(text: data['name'] ?? "");
    emailController = TextEditingController(text: data['email'] ?? "");
    numberController = TextEditingController(text: data['number'] ?? "");
    addressController = TextEditingController(text: data['address'] ?? "");
    age = int.tryParse(data['age'].toString()) ?? 20;
    image = data['image'];
    selectedLocation =
        addressController.text.isNotEmpty ? addressController.text : null;
  }

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    numberController.dispose();
    addressController.dispose();
    super.onClose();
  }

  void increaseAge() {
    age++;
    update();
  }

  void decreaseAge() {
    if (age > 0) age--;
    update();
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

  // Future<void> pickImage() async {
  //   final ImagePicker picker = ImagePicker();
  //   final XFile? image = await picker.pickImage(source: ImageSource.gallery);
  //   if (image != null) {
  //     pickedImage = File(image.path);
  //     update();
  //   }
  // }

  @override
  saveChanges(name, email, number, image, age, address) async {
    statusRequest = StatusRequest.loading;
    update();

    try {
      dio.FormData formData = dio.FormData.fromMap({
        "name": name,
        "email": email,
        "phonenumber": number,
        "age": age,
        "location": address,
        if (pickedImage != null)
          "image": dio.MultipartFile.fromBytes(
            await File(pickedImage!.path).readAsBytes(),
            filename: pickedImage!.path.split('/').last,
          ),
      });

      final response = await DioHelper.dioClient!.post(
        'http://10.0.2.2:8000/api/profile/update',
        data: formData,
        options: dio.Options(
          headers: {
            "Accept": "application/json",
            "Content-Type": "multipart/form-data",
          },
          followRedirects: false,
          validateStatus: (status) {
            return status != null && status < 500;
          },
        ),
      );

      print(response.data);
      if (response.statusCode == 200 || response.statusCode == 201) {
        var profileController = Get.find<ProfileControllerImp>();
        profileController.profileUser();
        statusRequest = StatusRequest.success;
        Get.back();
      } else {
        print(response.statusCode);

        statusRequest = StatusRequest.failure;
      }
    } catch (e) {
      print("Error during signup: $e");
      statusRequest = StatusRequest.serverfailure;
    }

    update();
  }

  void pickImage(source) async {
    final pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      pickedImage = File(pickedFile.path);
      update();
    }
  }
}
