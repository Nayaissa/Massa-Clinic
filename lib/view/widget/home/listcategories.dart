import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:lottie/lottie.dart';
import 'package:massaclinic/controller/home/homepage_controller.dart';
import 'package:massaclinic/core/class/statusrequest.dart';
import 'package:massaclinic/core/constant/AppColor.dart';
import 'package:massaclinic/core/constant/AppImagesAssets.dart';

class mmmm {
  mmmm(this.image, this.title);
  String? image;

  String? title;
}

List<mmmm> naya = [
  mmmm('assets/images/filler (2).png', 'Filler'),
  mmmm('assets/images/botoks.png', 'Botoks'),
  mmmm('assets/images/laser.png', 'Laser Hair'),
  mmmm('assets/images/nose.png', ' Nose Small'),
];

class ListCategoriesHome extends GetView<HomeControllerImp> {
  const ListCategoriesHome({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeControllerImp>(
      builder: (controller) {
    return    controller.servicepupstate == StatusRequest.loading ? 
        Lottie.asset(AppImageAssets.loding,height: 30) : 
        controller.servicepupstate == StatusRequest.noData ? 
        Lottie.asset(AppImageAssets.noData,height: 30) : 
         SizedBox(
          height: 100,
          width: 90,
          child: ListView.separated(
            separatorBuilder: (context, index) {
              return SizedBox(width: 10);
            },
            itemCount:
                controller.mostPuplarServicesModel                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       !.popularServices!.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Categories(
                i: index,
                kk: naya[index],
                itemName:
                    controller
                        .mostPuplarServicesModel!
                        .popularServices![index].serviceName
                        ,
              );
            },
          ),
        );
      },
    );
  }
}

class Categories extends GetView<HomeControllerImp> {
  const Categories({super.key, this.i, this.kk, this.itemName});
  // final CategoriesModel categoriesModel;
  final int? i;
  final mmmm? kk;
  final String? itemName;
  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: () {},
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: AppColor.thirdColor,
              borderRadius: BorderRadius.circular(15),
            ),
            height: 70,
            width: 80,
            child: Image.asset(color: AppColor.gery800, kk!.image!),
          ),
          SizedBox(height: 5),
          Text(
            itemName!,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: const Color.fromARGB(255, 110, 108, 108),
            ),
          ),
        ],
      ),
    );
  }
}
