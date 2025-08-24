import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:massaclinic/controller/auth/signup_controller.dart';
import 'package:massaclinic/core/constant/AppColor.dart';

class CustomAgeFormField extends StatelessWidget {
  final String labelText;
  final String hintText;
    final String? Function(String?)? valid;


  const CustomAgeFormField({
    super.key,
    required this.labelText,
    required this.hintText, this.valid,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignUpControllerImp>(
      builder: (controller) {
        return Container(
          margin: const EdgeInsets.only(bottom: 15),
          child: TextFormField(
            controller: TextEditingController(
              text: controller.age.toString(),
            ),
            readOnly: true,
              validator: valid,
           decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: hintText,
          hintStyle: TextStyle(fontSize: 12),
          contentPadding: EdgeInsets.symmetric(vertical: 1, horizontal: 30),
          label: Container(
            margin: EdgeInsets.symmetric(horizontal: 3),
            child: Text(labelText),
          ),
              prefixIcon: const Icon(Icons.cake, color: Colors.grey),
              suffixIcon: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: controller.increaseAge,
                    child: const Icon(Icons.arrow_drop_up,
                        size: 26, color: AppColor.primaryColor),
                  ),
                  InkWell(
                    onTap: controller.decreaseAge,
                    child: const Icon(Icons.arrow_drop_down,
                        size: 26, color: AppColor.primaryColor),
                  ),
                ],
              ),
             
              border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide:
                const BorderSide(color: AppColor.secondaryColor, width: 1),
          
              ),
            ),
          ),
        );
      },
    );
  }
}
