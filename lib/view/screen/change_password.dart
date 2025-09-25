import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:massaclinic/controller/auth/change_password.dart';
import 'package:massaclinic/core/functons/vaildinput.dart';
import 'package:massaclinic/view/widget/auth/CustomButtonAuth.dart';
import 'package:massaclinic/view/widget/auth/CustomTextBodyAuth.dart';
import 'package:massaclinic/view/widget/auth/CustomTextFormFiled.dart';
import 'package:massaclinic/view/widget/auth/CustomTextTitleAuth.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ChangePasswordControllerImp());

    return Scaffold(
      appBar: AppBar(),
      body: GetBuilder<ChangePasswordControllerImp>(
        builder: (controller) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Form(
              key: controller.formstate,
              child: ListView(
                children: [
                  const SizedBox(height: 10),
                  CustomTextTitleAuth(
                    text: "Change Password",
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  CustomTextBodyAuth(
                    textBody:
                        "Please enter your old password and your new password",
                  ),
                  const SizedBox(height: 30),

                  // 🔹 old password
                  CustomTextFormFiled(
                    onTap: () {
                      controller.showpassword();
                    },
                    obscureText: controller.isshowpassword,
                    iconprefix: controller.isshowpassword == true
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                    valid: (val) {
                      return validInput(val!, 5, 30, "password");
                    },
                    myController: controller.oldPassword,
                    hintText: "Enter your old password",
                    labelText: "Old Password",
                    iconData: Icons.lock_outline,
                  ),
                  const SizedBox(height: 20),

                  // 🔹 new password
                  CustomTextFormFiled(
                    onTap: () {
                      controller.showpassword();
                    },
                    obscureText: controller.isshowpassword,
                    iconprefix: controller.isshowpassword == true
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                    valid: (val) {
                      return validInput(val!, 5, 30, "password");
                    },
                    myController: controller.password,
                    hintText: "Enter your new password",
                    labelText: "New Password",
                    iconData: Icons.lock_outline,
                  ),
                  const SizedBox(height: 20),

                  // 🔹 confirm new password
                  CustomTextFormFiled(
                    onTap: () {
                      controller.showpassword();
                    },
                    obscureText: controller.isshowpassword,
                    iconprefix: controller.isshowpassword == true
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                    valid: (val) {
                      if (val != controller.password.text) {
                        return "Passwords do not match";
                      }
                      return validInput(val!, 5, 30, "password");
                    },
                    myController: controller.confirmPassword,
                    hintText: "Confirm your new password",
                    labelText: "Confirm Password",
                    iconData: Icons.lock_outline,
                  ),
                  const SizedBox(height: 30),

                  // 🔹 button
                  CustomButtonAuth(
                    textButton: "Update Password",
                    onPressed: () {
                      controller.changePassword();
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
