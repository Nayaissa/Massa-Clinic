
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:massaclinic/controller/home/homescreen_controller.dart';
import 'package:massaclinic/core/constant/AppColor.dart';
import 'package:massaclinic/view/widget/home/custombottomapppar.dart';

class CustomBottomNavBar extends GetView {
  const CustomBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenControllerImp>(
      builder: (controller) {
        return BottomAppBar(
      
         color:AppColor.backgroundColor,
          
          shape: CircularNotchedRectangle(),
          notchMargin: 10,
          child: Card(
            
            color:AppColor.thirdColor,
            
         elevation: 3,
          
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ...List.generate(controller.listpage.length + 1, (index) {
                  int i = index > 2 ? index - 1 : index;
                  return index == 2
                      ? Spacer()
                      : CustomBottonAppar(
                        active: controller.currentpage == i ? true : false,
                        textbutton: controller.titlebottomappar[i],
                        onPressed: () {
                          controller.changePage(i);
                        },
                        iconData:controller.icon[i] ,
                      );
                }),
              ],
            ),
          ),
        );
      },
    );
  }
}
