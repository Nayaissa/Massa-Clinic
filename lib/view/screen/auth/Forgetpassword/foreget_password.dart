import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:massaclinic/controller/auth/forgetpassword_controller.dart';
import 'package:massaclinic/core/class/statusrequest.dart';
import 'package:massaclinic/core/constant/AppImagesAssets.dart';
import 'package:massaclinic/core/functons/vaildinput.dart';
import 'package:massaclinic/view/widget/auth/CustomButtonAuth.dart';
import 'package:massaclinic/view/widget/auth/CustomTextBodyAuth.dart';
import 'package:massaclinic/view/widget/auth/CustomTextFormFiled.dart';
import 'package:massaclinic/view/widget/auth/CustomTextTitleAuth.dart';

class ForegetpassswordScreen extends StatelessWidget {
  const ForegetpassswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
     Get.put(
      ForgetpasswordControllerImp(),
    );
    return Scaffold(
      appBar: AppBar(),
      body: GetBuilder<ForgetpasswordControllerImp>(
        builder: (controller) {
          return controller.statusRequest == StatusRequest.loading
              ? Center(
                child: Lottie.asset(
                  AppImageAssets.loding,
                  repeat: true,
                  width: 250,
                  height: 200,
                ),
              )
              : Container(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: Form(
                  key: controller.formstate,
                  child: ListView(
                    children: [
                      SizedBox(height: 10),

                      SizedBox(height: 10),
                      CustomTextTitleAuth(
                        text: '20'.tr,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 10),

                      Image.asset(
                        'assets/images/forgetpassword.png',
                        height: 150,
                        width: double.infinity,
                      ),
                      SizedBox(height: 20),
                      CustomTextBodyAuth(
                        textBody: '21'.tr,
                      ),
                      SizedBox(height: 10),

                      CustomTextFormFiled(
                        valid: (val) {
                          return validInput(val!, 5, 100, 'email');
                        },
                         myController: controller.email,
                        hintText: '3'.tr,
                        labelText: '4'.tr,
                        iconData: Icons.email_outlined,
                      ),
                      Spacer(flex: 3),

                      CustomButtonAuth(
                        textButton: '22'.tr,
                        onPressed: () {
                          controller.goToVerfiactionCode();
                        },
                      ),
                    ],
                  ),
                ),
              );
        },
      ),
    );
  }
}
