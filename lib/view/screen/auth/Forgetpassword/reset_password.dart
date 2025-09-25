import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:massaclinic/controller/auth/resetpassword_controller.dart';
import 'package:massaclinic/core/functons/vaildinput.dart';
import 'package:massaclinic/view/widget/auth/CustomButtonAuth.dart';
import 'package:massaclinic/view/widget/auth/CustomTextBodyAuth.dart';
import 'package:massaclinic/view/widget/auth/CustomTextFormFiled.dart';
import 'package:massaclinic/view/widget/auth/CustomTextTitleAuth.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
 Get.put(
      ResetpasswordControllerImp(),
    );
    return Scaffold(
      appBar: AppBar(),
      body: GetBuilder<ResetpasswordControllerImp>(
        builder: (controller) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Form(
              key: controller.formstate,
              child: ListView(
                children: [
                  SizedBox(height: 10),
                  CustomTextTitleAuth(
                    text: '23'.tr,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  CustomTextBodyAuth(
                    textBody: '24'.tr,
                  ),
                  SizedBox(height: 30),

                  CustomTextFormFiled(
                    onTap: () {
                      controller.showpassword();
                    },
                    obscureText: controller.isshowpassword,
                    iconprefix:
                        controller.isshowpassword == true
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                    valid: (val) {
                      return validInput(val!, 5, 30, 'password');
                    },
                    myController: controller.password,
                    hintText: '5'.tr,
                    labelText: '5'.tr,
                    iconData: Icons.lock_outline,
                  ),
                  CustomTextFormFiled(
                    onTap: () {
                      controller.showpassword();
                    },
                    obscureText: controller.isshowpassword,
                    iconprefix:
                        controller.isshowpassword == true
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                    valid: (val) {
                      
                      return validInput(val!, 5, 30, 'password');
                    
                      
                      
                    },
                    myController: controller.passwordconfrim,
                    hintText: '25'.tr,
                    labelText: '5'.tr,
                    iconData: Icons.lock_outline,
                  ),
                  CustomButtonAuth(
                    textButton: '26'.tr,
                    onPressed: () {
                      controller.goToSuccess();
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
