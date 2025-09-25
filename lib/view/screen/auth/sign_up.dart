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
import 'package:massaclinic/view/widget/auth/custom_age_auth.dart';
import 'package:massaclinic/view/widget/auth/custom_location_auth.dart';
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
                  CustomAppar
                  (image: AppImageAssets.person, radius: 15,
                  colorcon:AppColor.secondaryColor,
                 coloriconcam: Colors.white,

                  ),
            controller.statusRequest== StatusRequest.loading ?LottieBuilder.asset(AppImageAssets.loding,repeat: true,height: 200,)   :
               Container(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CustomTextTitleAuth(
                          text: '10'.tr,
                          textAlign: TextAlign.start,
                        ),
                        const SizedBox(height: 20),
                       
                        SizedBox(height: 20),
                        CustomTextFormFiled(
                          valid: (val) {
                            return validInput(val!, 5, 100, 'username');
                          },
                            myController: controller.userName,
                          hintText: '18'.tr,
                          labelText: '17'.tr,
                          iconData: Icons.person_outline,
                        ),
                        CustomTextFormFiled(
                          valid: (val) {
                            return validInput(val!, 5, 100, 'email');
                          },
                           myController: controller.email,
                          hintText: '3'.tr,
                          labelText: '4'.tr,
                          iconData: Icons.email_outlined,
                        ),
                        CustomTextFormFiled(
                          valid: (val) {
                            return validInput(val!, 10, 15, 'phoneNumber');
                          },
                            myController: controller.phoneNumber,
                          hintText: '16'.tr,
                          labelText: '15'.tr,
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
                              hintText: '5'.tr,
                              labelText: '5'.tr,
                              iconData: Icons.lock_outline,
                            ),
                            CustomAgeFormField(labelText: '14'.tr,hintText:'14'.tr ,valid: (val) {
                               return validInput(val!, 2, 3, 'password');
                            },),
                             CustomLocationField(
                labelText: "11".tr,
                hintText: "11".tr,
                selectedValue: controller. selectedLocation,
                items:  controller.locations,
                onChanged: (val) {
                   controller.setLocation(val);
                },
              ),
                        CustomButtonAuth(
                          textButton: '9'.tr,
                          onPressed: () {
                              controller.SignUp();
                          },
                        ),
                        CustomTextSignUpOrSignIn(
                          textOne: '12'.tr,
                          textTwo: '13'.tr,
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
