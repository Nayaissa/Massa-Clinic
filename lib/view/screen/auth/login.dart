import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:massaclinic/controller/auth/login_controller.dart';
import 'package:massaclinic/core/class/statusrequest.dart';
import 'package:massaclinic/core/constant/AppColor.dart';
import 'package:massaclinic/core/constant/AppImagesAssets.dart';
import 'package:massaclinic/core/functons/alertexitapp.dart';
import 'package:massaclinic/core/functons/vaildinput.dart';
import 'package:massaclinic/core/localization/localChange.dart';
import 'package:massaclinic/view/widget/auth/CustomButtonAuth.dart';
import 'package:massaclinic/view/widget/auth/CustomTextBodyAuth.dart';
import 'package:massaclinic/view/widget/auth/CustomTextFormFiled.dart';
import 'package:massaclinic/view/widget/auth/CustomTextSignUpOrSignIn.dart';
import 'package:massaclinic/view/widget/auth/CustomTextTitleAuth.dart';
import 'package:massaclinic/view/widget/auth/customappar.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LoginControllerImp());

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.backgroundColor,
        body: WillPopScope(
          onWillPop: AlretExitApp,
          child: GetBuilder<LoginControllerImp>(
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
                  : Form(
                    key: controller.formstate,
                    child: Column(
                      children: [
                        Expanded(
                          child: ListView(
                            children: [
                              CustomAppar(
                                radius: 0,
                                image: AppImageAssets.logoImage,
                                colorcon: AppColor.secondaryColor,
                                coloriconcam: AppColor.backgroundColor,
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 14,
                                ),
                                child: Column(
                                  children: [
                                      CustomTextTitleAuth(
                                      text: '1'.tr, 
                                      textAlign: TextAlign.center,
                                           ),


                                    const SizedBox(height: 20),
                                     CustomTextBodyAuth(
                                      textBody:
                                          '2'.tr,
                                    ),
                                    const SizedBox(height: 20),
                                    CustomTextFormFiled(
                                      valid: (val) {
                                        return validInput(
                                          val!,
                                          5,
                                          100,
                                          'email',
                                        );
                                      },
                                      myController: controller.email,
                                      hintText: '4'.tr,
                                      labelText: '3'.tr,
                                      iconData: Icons.email_outlined,
                                    ),
                                    GetBuilder<LoginControllerImp>(
                                      builder: (controller) {
                                        return CustomTextFormFiled(
                                          onTap: () {
                                            controller.showpassword();
                                          },
                                          obscureText:
                                              controller.isshowpassword,
                                          iconprefix:
                                              controller.isshowpassword == true
                                                  ? Icons
                                                      .visibility_off_outlined
                                                  : Icons.visibility_outlined,
                                          valid: (val) {
                                            return validInput(
                                              val!,
                                              5,
                                              30,
                                              'password',
                                            );
                                          },
                                          myController: controller.password,
                                          hintText: '5'.tr,
                                          labelText: '5'.tr,
                                          iconData: Icons.lock_outline,
                                        );
                                      },
                                    ),
                                    InkWell(
                                      onTap: () {
                                        controller.goToForegetPassword();
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Text(
                                            '6'.tr,
                                            textAlign: TextAlign.end,
                                            style:
                                                Theme.of(
                                                  context,
                                                ).textTheme.bodyMedium,
                                          ),
                                        ],
                                      ),
                                    ),
                                    CustomButtonAuth(
                                      textButton: '7'.tr,
                                      onPressed: () {
                                        controller.login();
                                      },
                                    ),
                                    CustomTextSignUpOrSignIn(
                                      textOne: '8'.tr,
                                      textTwo: '9'.tr,
                                      onTap: () {
                                        controller.goToSignUp();
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),

                       Padding(
  padding: const EdgeInsets.only(bottom: 20),
  child: GetBuilder<LocalController>(
    init: LocalController(),
    builder: (localController) {
      final isArabic = localController.language?.languageCode == 'ar';
      final nextLangCode = isArabic ? 'en' : 'ar';
      final nextLangLabel = isArabic ? 'الانجليزية' : 'Arabic';

      return GestureDetector(
        onTap: () {
          localController.changeLange(nextLangCode);
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              isArabic ? Icons.arrow_back_ios : Icons.arrow_forward_ios,
              size: 20,
              color: AppColor.primaryColor,
            ),
            const SizedBox(width: 6),
            Text(
              nextLangLabel,
              style: TextStyle(
                color: AppColor.primaryColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      );
    },
  ),
),

                      ],
                    ),
                  );
            },
          ),
        ),
      ),
    );
  }
}
