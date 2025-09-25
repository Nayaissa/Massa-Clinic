import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:massaclinic/core/constant/AppColor.dart';
import 'package:massaclinic/core/constant/routes.dart';
import 'package:massaclinic/view/widget/auth/CustomButtonAuth.dart';

class SuccessSignUp extends StatelessWidget {
  const SuccessSignUp({super.key});

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
                  "assets/images/successreset.png", // You can change this to a signup success image
                  width: 200,
                  height: 200,
                  fit: BoxFit.fill,
                ),
                const SizedBox(height: 30),

                const Text(
                  "Account Created Successfully",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppColor.primaryColor,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                const Text(
                  "Welcome to Massa Beauty Clinic!\nYour account has been created successfully.\nYou can now log in with your credentials.",
                  style: TextStyle(fontSize: 16, color: AppColor.gery800),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40),
                CustomButtonAuth(
                  textButton: 'Login Now',
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
