import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:massaclinic/core/constant/AppColor.dart';
import 'package:massaclinic/core/constant/routes.dart';
import 'package:massaclinic/view/widget/auth/CustomButtonAuth.dart';

class SuccessResetPassword extends StatelessWidget {
  const SuccessResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/successreset.png",
                  width: 200,
                  height: 200,
                  fit: BoxFit.fill,
                ),
                const SizedBox(height: 30),

                const Text(
                  "Password Reset Successfully",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppColor.primaryColor,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                const Text(
                  "  Your password has been reset successfully.\n You can now log in with your new password.",
                  style: TextStyle(fontSize: 16, color: AppColor.gery800),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40),
                CustomButtonAuth(
                  textButton: 'Login again',
                  onPressed: () {
                    Get.offAllNamed(AppRoute.login);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
