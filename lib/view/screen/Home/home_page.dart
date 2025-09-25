import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:massaclinic/controller/home/homepage_controller.dart';
import 'package:massaclinic/core/constant/AppColor.dart';
import 'package:massaclinic/view/widget/home/buildSvgGridItem.dart';
import 'package:massaclinic/view/widget/home/customapparhome.dart';
import 'package:massaclinic/view/widget/home/customcard.dart';
import 'package:massaclinic/view/widget/home/customtitlehome.dart';
import 'package:massaclinic/view/widget/home/listcategories.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());
    return GetBuilder<HomeControllerImp>(
      builder: (controller) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: ListView(
            children: [
              Customapparhome(
               title: '87'.tr,
  prefixIcon: Icons.search_outlined,
  onPressed: () {},
  onPressedsearch: () {},
  onPressedFav: () {
    controller.goToFav();
  },
              ),
              // CustomCard(title: '88'.tr, subtitle: '89'.tr),
CustomCarousel(
            images: [
              "assets/images/calouser1.jpg",
              "assets/images/calouser2.jpg",
              "assets/images/calouser3.jpg",
              // "assets/images/image4.jpg",
            ],
          ),
              Customtitlehome(title: '90'.tr),
              ListCategoriesHome(),
              
              Customtitlehome(title: '91'.tr),

              Card(
                color: AppColor.backgroundColor,
                elevation: 5,
                shadowColor: AppColor.thirdColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                  ),
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    final List<Map<String, String>> items = [
                      {
                        'title': '92'.tr,
                        'svgPath': 'assets/images/Complaints.png',
                      },
                      {
                        'title': '93'.tr,
                        'svgPath': 'assets/images/Archive.png',
                      },
                      {
                        'title': '94'.tr,
                        'svgPath': 'assets/images/sevices.png',
                      },
                      {
                        'title': '95'.tr,
                        'svgPath': 'assets/images/Reservations.png',
                      },
                      {
                        'title': '96'.tr,
                        'svgPath': 'assets/images/Advertisements.png',
                      },
                      {
                        'title': '97'.tr,
                        'svgPath': 'assets/images/Payment.png',
                      },
                    ];

                    return BuildSvgGridItem(
                      title: items[index]['title']!,
                      svgPath: items[index]['svgPath']!,
                      onTap: () {
                        Get.toNamed(controller.nav[index]);
                      },
                    );
                  },
                ),
              ),

              //  CustomProductMostSeller(),
            ],
          ),
        );
      },
    );
  }
}
