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
               title: 'search here',
  prefixIcon: Icons.search_outlined,
  onPressed: () {},
  onPressedsearch: () {},
  onPressedFav: () {
    controller.goToFav();
  },
              ),
              CustomCard(title: 'summer ckeck', subtitle: 'Check discount'),

              Customtitlehome(title: 'most puplar'),
              ListCategoriesHome(),
              
              Customtitlehome(title: 'All Services'),

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
                        'title': 'Complaits',
                        'svgPath': 'assets/images/Complaints.png',
                      },
                      {
                        'title': 'Archive',
                        'svgPath': 'assets/images/Archive.png',
                      },
                      {
                        'title': 'Services',
                        'svgPath': 'assets/images/sevices.png',
                      },
                      {
                        'title': 'Reservation',
                        'svgPath': 'assets/images/Reservations.png',
                      },
                      {
                        'title': 'Adverts',
                        'svgPath': 'assets/images/Advertisements.png',
                      },
                      {
                        'title': 'Payments',
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
