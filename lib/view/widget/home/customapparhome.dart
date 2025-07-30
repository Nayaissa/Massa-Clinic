import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:massaclinic/controller/home/homepage_controller.dart';
import 'package:massaclinic/controller/profile_controller.dart';
import 'package:massaclinic/core/constant/AppColor.dart';
import 'package:massaclinic/core/constant/AppImagesAssets.dart';

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
            Get.put(ProfileControllerImp());

            
//
    
    return GetBuilder<ProfileControllerImp>(
      builder: (controller) {
        return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: const BoxDecoration(
        color:AppColor.primaryColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: Row(
        children: [
          CircleAvatar(
                radius: 25,
                backgroundImage: 
                controller.profileModel?.profileImageUrl != null ?
                NetworkImage(controller.profileModel!.profileImageUrl!) :
                AssetImage(AppImageAssets.person)
              

              ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                Text(
                  '${controller.profileModel?.name}',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
                ),
                SizedBox(height: 2),
                Text(
                  '${controller.profileModel?.phonenumber}',
                  style: TextStyle(color: Colors.white70, fontSize: 13),
                ),
              ],
            ),
          ),
          InkWell( onTap: onPressedFav
            
          ,child: const Icon(Icons.favorite_border_outlined, color: Colors.white,size: 25,)),
          const SizedBox(width: 12),
          InkWell(onTap: () {
            
          },child: const Icon(Icons.notifications_active_outlined, color: Colors.white,size:25)),
        ],
      ),
    );
      },
    );
  }
}
//   CustomContainerIcon(icon:    Icons.favorite_border_rounded,onPressedIcon: onPressedFav,),
             
   //      CustomContainerIcon(icon:  Icons.notifications_active_outlined,onPressedIcon: () {
               