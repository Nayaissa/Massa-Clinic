import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:massaclinic/controller/auth/signup_controller.dart';
import 'package:massaclinic/core/class/statusrequest.dart';
import 'package:massaclinic/core/constant/AppColor.dart';
import 'package:massaclinic/core/constant/AppImagesAssets.dart';
import 'package:massaclinic/core/functons/vaildinput.dart';
import 'package:massaclinic/view/widget/auth/CustomButtonAuth.dart';
import 'package:massaclinic/view/widget/auth/CustomTextFormFiled.dart';
import 'package:massaclinic/view/widget/auth/CustomTextSignUpOrSignIn.dart';
import 'package:massaclinic/view/widget/auth/CustomTextTitleAuth.dart';
import 'package:massaclinic/view/widget/auth/customappar.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
 Get.put(SignUpControllerImp()); 
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: SafeArea(
        child: GetBuilder<SignUpControllerImp>(
          builder: (controller) {
            return Form(
              key: controller.formstate,
              child: ListView(
                children: [
                  CustomAppar(image: AppImageAssets.person, radius: 15,colorcon:AppColor.secondaryColor),
            controller.statusRequest== StatusRequest.loading ?LottieBuilder.asset(AppImageAssets.loding,repeat: true,height: 200,)   :
               Container(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const CustomTextTitleAuth(
                          text: 'Create Account',
                          textAlign: TextAlign.start,
                        ),
                        const SizedBox(height: 20),
                        // const CustomTextBodyAuth(
                        //   textBody:
                        //       'SigIn With Your Email And Password OR Continue With Social Media',
                        // ),
                        SizedBox(height: 20),
                        CustomTextFormFiled(
                          valid: (val) {
                            return validInput(val!, 5, 100, 'username');
                          },
                            myController: controller.userName,
                          hintText: 'Enter Your Name',
                          labelText: 'UserName',
                          iconData: Icons.person_outline,
                        ),
                        CustomTextFormFiled(
                          valid: (val) {
                            return validInput(val!, 5, 100, 'email');
                          },
                           myController: controller.email,
                          hintText: 'Enter Your Email',
                          labelText: 'Email',
                          iconData: Icons.email_outlined,
                        ),
                        CustomTextFormFiled(
                          valid: (val) {
                            return validInput(val!, 10, 15, 'phoneNumber');
                          },
                            myController: controller.phoneNumber,
                          hintText: 'Enter Your Number',
                          labelText: 'PhoneNumber',
                          iconData: Icons.phone_android_outlined,
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
                              myController: controller.password,
                              hintText: 'Enter Your Password',
                              labelText: 'Password',
                              iconData: Icons.lock_outline,
                            ),
                        CustomButtonAuth(
                          textButton: 'SignUp',
                          onPressed: () {
                              controller.SignUp();
                          },
                        ),
                        CustomTextSignUpOrSignIn(
                          textOne: 'Have Any Account?',
                          textTwo: ' Sign in',
                          onTap: () {
                            controller.goToLogin();
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
