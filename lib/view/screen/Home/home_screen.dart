
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:massaclinic/controller/home/homescreen_controller.dart';
import 'package:massaclinic/view/widget/home/custombottomnavbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerImp());
    return GetBuilder<HomeScreenControllerImp>(
      builder: (controller) {
        return Scaffold(
          // backgroundColor: AppColor.backgroundColor,
          // floatingActionButton: SizedBox(
          //   height: 45, 
          //   width: 45,
          //   child: FloatingActionButton(
          //     shape: CircleBorder(),
          //     backgroundColor: AppColor.primaryColor,
          //     onPressed: () {},
          //     child: Icon(
          //       Icons.shopping_basket_outlined,
          //       color: AppColor.backgroundColor,
          //       size: 20, // حجم الأيقونة
          //     ),
          //   ),
          // ),

          // floatingActionButtonLocation:
          //     FloatingActionButtonLocation.centerDocked,
              
          bottomNavigationBar: CustomBottomNavBar(),
          body: controller.listpage.elementAt(controller.currentpage),
        );
      },
    );
  }
}
