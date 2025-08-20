import 'package:flutter/material.dart';
import 'package:massaclinic/core/constant/AppColor.dart';

class CustomTextFormEditProfile extends StatelessWidget {
  const CustomTextFormEditProfile({super.key, required this.text, required this.icon, required this.controller});
  final String text;
  final IconData icon;
  final  TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: text,
        prefixIcon: Icon(icon, color: Colors.grey[600]),
        filled: true,
         fillColor: AppColor.thirdColor.withOpacity(0.34),
        contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: AppColor.secondaryColor, width: 1),
        ),
      ),
      style: TextStyle(fontSize: 16, color: AppColor.gery800),
    );
  }
}
