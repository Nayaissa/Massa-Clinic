import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:massaclinic/controller/services/favorite_services_controller.dart';
import 'package:massaclinic/core/class/statusrequest.dart';
import 'package:massaclinic/core/constant/AppColor.dart';
import 'package:massaclinic/core/constant/AppImagesAssets.dart';
import 'package:massaclinic/view/widget/Favorite&search/customsearch.dart';
import 'package:massaclinic/view/widget/reservation/customappar.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(FavoriteServicesControllerImp());
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: Column(
        children: [
          SafeArea(
            child: CustomApparReservation(
              title: 'My Favorite',
              icon: Icons.arrow_back_ios_new,
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: GetBuilder<FavoriteServicesControllerImp>(
              builder: (controller) {
                return controller.favStatusRequest == StatusRequest.loading
                    ? Lottie.asset(AppImageAssets.loding, width: 250)
                    : controller.favStatusRequest == StatusRequest.noData
                    ? Lottie.asset(AppImageAssets.noData, width: 250)
                    : ListView.separated(
                      padding: const EdgeInsets.symmetric(
                        vertical: 4,
                        horizontal: 10,
                      ),
                      itemCount: controller.favoriteModel?.data?.length ?? 0,
                      separatorBuilder:
                          (context, index) => const SizedBox(height: 10),
                      itemBuilder: (context, index) {
                        final item = controller.favoriteModel?.data?[index];

                        return CustomSerach(
                          imageUrl:
                              item?.image?.replaceAll(
                                '127.0.0.1',
                                '10.0.2.2',
                              ) ??
                              'assets/images/doctor1.jpg',
                          title: item?.name ?? 'hhhh',
                          subtitle: '${item?.price} \$',
                          onPressedFav: () {
                            controller.addToFavorite(item.id.toString(), index);
                          },
                          is_favorite: item!.isFavorite,
                        );
                      },
                    );
              },
            ),
          ),
        ],
      ),
    );
  }
}
