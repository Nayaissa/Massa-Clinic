import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:massaclinic/controller/auth/verfication_controller.dart';
import 'package:massaclinic/core/constant/AppColor.dart';
import 'package:massaclinic/view/widget/auth/CustomTextBodyAuth.dart';
import 'package:massaclinic/view/widget/auth/CustomTextTitleAuth.dart';

class VerfiyCodeScreen extends StatelessWidget {
  const VerfiyCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
   VerfiyCodeControllerImp controller= Get.put(VerfiyCodeControllerImp());
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: ListView(
          children: [
            SizedBox(height: 10),
            CustomTextTitleAuth(
              text: '27'.tr,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            CustomTextBodyAuth(textBody: '28'.tr),
            SizedBox(height: 30),

            OtpTextField(
              numberOfFields: 5,
              fieldWidth: 50,
              borderRadius: BorderRadius.circular(10),
              borderColor: Color(0xFF512DA8),
              disabledBorderColor: AppColor.primaryColor,
              enabledBorderColor: AppColor.primaryColor,
              decoration: InputDecoration(fillColor: AppColor.primaryColor),
              showFieldAsBox: true,
              onCodeChanged: (String code) {
                  // controller.goToResert(code);
              },
              onSubmit: (String verificationCode) {
                 controller.goToResert(verificationCode);
              }, 
            ),
          ],
        ),
      ),
    );
  }
}
