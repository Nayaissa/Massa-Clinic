import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:massaclinic/controller/home/homepage_controller.dart';
import 'package:massaclinic/controller/profile_controller.dart';
import 'package:massaclinic/core/constant/AppColor.dart';
import 'package:massaclinic/core/constant/AppImagesAssets.dart';
import 'package:massaclinic/view/widget/home/customcontainericon.dart';

class Customapparhome extends GetView<HomeControllerImp> {
  const Customapparhome({
    super.key,
    required this.title,
    required this.prefixIcon,
    this.onPressed,
    this.onPressedsearch,
    this.onPressedFav,
  });
  final String title;
  final IconData prefixIcon;
  final void Function()? onPressed;
  final void Function()? onPressedsearch;
  final void Function()? onPressedFav;

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());

    
    return GetBuilder<HomeControllerImp>(
      builder: (controller) {
        return Container(
          margin: EdgeInsets.only(top: 15),
          child: Row(
            children: [
    
              CircleAvatar(
                radius: 25,
                backgroundImage: 
                controller.profileModel?.profileImageUrl != null ?
                NetworkImage(controller.profileModel!.imageUrl!) :
                AssetImage(AppImageAssets.person)
              

              ),
              SizedBox(width: 5),
              Text(
                '  Hi \n ' + '${controller.profileModel?.name}' ?? '',
                style: TextStyle(fontSize: 16, color: AppColor.primaryColor),
              ),
              Spacer(),
           CustomContainerIcon(icon:    Icons.favorite_border_rounded,onPressedIcon: onPressedFav,),
             
         CustomContainerIcon(icon:  Icons.notifications_active_outlined,onPressedIcon: () {
               
             },)
             
            ],
          ),
        );
      },
    );
  }
}