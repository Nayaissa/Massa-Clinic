import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:massaclinic/controller/home/homepage_controller.dart';
import 'package:massaclinic/core/constant/AppColor.dart';

class Customtitlehome extends GetView<HomeControllerImp> {
  const Customtitlehome({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10,bottom: 15),
      child: Text(
        title,
        style: Theme.of(context).textTheme.displayLarge!.copyWith(
          color:AppColor.primaryColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
