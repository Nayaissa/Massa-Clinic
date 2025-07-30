import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:massaclinic/core/constant/AppColor.dart';

class CustomAppBarApp extends StatelessWidget {
  const CustomAppBarApp({super.key, required this.textApp});
  final String textApp;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 9, left: 15),
      height: 60,
      width: double.infinity,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: AppColor.primaryColor.withOpacity(0.1),
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(25),
          bottomRight: Radius.circular(25),
        ),
      ),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              Get.back();
            },
            child: Icon(Icons.arrow_back_ios_new, size: 20),
          ),
          SizedBox(width: 6),
          Text(
            textApp,
            style: TextStyle(fontSize: 20, color: AppColor.gery800),
          ),
        ],
      ),
    );
  }
}
