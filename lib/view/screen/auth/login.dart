import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:massaclinic/controller/auth/login_controller.dart';
import 'package:massaclinic/core/class/statusrequest.dart';
import 'package:massaclinic/core/constant/AppColor.dart';
import 'package:massaclinic/core/constant/AppImagesAssets.dart';
import 'package:massaclinic/core/functons/alertexitapp.dart';
import 'package:massaclinic/core/functons/vaildinput.dart';
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
        // ignore: deprecated_member_use
        body: WillPopScope(
          onWillPop: AlretExitApp,
          child: GetBuilder<LoginControllerImp>(
            builder: (controller) {
              return
               controller.statusRequest == StatusRequest.loading ?
              Center(child:  Lottie.asset(AppImageAssets.loding,repeat: true ,width: 250,height: 200),)
               :
              Form(
                 key: controller.formstate,
                child: ListView(
                  children: [
                    CustomAppar(radius:0,image:AppImageAssets.logoImage,colorcon:AppColor.secondaryColor),
                     Container(
                      padding: EdgeInsets.symmetric(horizontal: 14),
                      child: Column(
                        children: [
                               CustomTextTitleAuth(text: 'Welcome Back',textAlign: TextAlign.center,),
              
                    SizedBox(height: 20),
                    CustomTextBodyAuth(
                      textBody:
                          'SigIn With Your Email And Password OR Continue With Social Media',
                    ),
              
                    SizedBox(height: 20),
                    CustomTextFormFiled(
                      valid: (val) {
                        return validInput(val!, 5, 100, 'email');
                      },
                      myController: controller.email,
                      hintText: 'Enter Your Email',
                      labelText: 'Email',
                      iconData: Icons.email_outlined,
                    ),
                    GetBuilder<LoginControllerImp>(
                      builder: (controller) {
                        return CustomTextFormFiled(
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
                        );
                      },
                    ),
                    InkWell(
                      onTap: () {
                        controller.goToForegetPassword();
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'Forget Password ?',
                            textAlign: TextAlign.end,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                    ),
                    CustomButtonAuth(
                      textButton: 'Login',
                      onPressed: () {
                        controller.login();
                      },
                    ),
                    CustomTextSignUpOrSignIn(
                      textOne: 'Dont Have Any Account?',
                      textTwo: ' Sign Up',
                      onTap: () {
                        controller.goToSignUp();
                      },
                    ),
                        ],
                      ),
                     )
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
