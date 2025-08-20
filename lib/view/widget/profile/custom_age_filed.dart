import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:massaclinic/controller/edit_profile_controller.dart';
import 'package:massaclinic/core/constant/AppColor.dart';

class CustomAgeField extends StatelessWidget {
  final String label;

  const CustomAgeField({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EditProfileControllerImp>(
      builder: (controller) {
        return TextFormField(
          controller: TextEditingController(text: controller.age.toString()),
          readOnly: true, 
          decoration: InputDecoration(
            labelText: label,
            prefixIcon:  Icon(Icons.cake, color:Colors.grey[600]),
              filled: true,
        fillColor: AppColor.thirdColor.withOpacity(0.34),
        contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide.none,
        ),
       
            suffixIcon: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: controller.increaseAge,
                  child: const Icon(Icons.arrow_drop_up,
                      size: 28, color: AppColor.primaryColor),
                ),
                InkWell(
                  onTap: controller.decreaseAge,
                  child: const Icon(Icons.arrow_drop_down,
                      size: 28, color: AppColor.primaryColor),
                ),
              ],
            ),
          
          
          ),
        );
      },
    );
  }
}
