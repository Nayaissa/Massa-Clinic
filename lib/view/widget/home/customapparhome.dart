import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:badges/badges.dart' as badges;

import 'package:massaclinic/controller/home/homepage_controller.dart';
import 'package:massaclinic/controller/notification_controller.dart';
import 'package:massaclinic/core/constant/AppColor.dart';
import 'package:massaclinic/core/constant/AppImagesAssets.dart';
import 'package:massaclinic/core/constant/routes.dart';
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
    Get.put(NotificationController());

    return GetBuilder<HomeControllerImp>(
      builder: (controller) {
        final ImageProvider avatarProvider =
            (controller.profileModel?.imageUrl != null &&
                    controller.profileModel!.imageUrl!.isNotEmpty)
                ? NetworkImage(controller.profileModel!.imageUrl!)
                : AssetImage(AppImageAssets.person) as ImageProvider;

        return Container(
          margin: const EdgeInsets.only(top: 15),
          child: Row(
            children: [
              CircleAvatar(radius: 25, backgroundImage: avatarProvider),
              const SizedBox(width: 5),
              Text(
                '  Hi \n ${controller.profileModel?.name ?? ''}',
                style: TextStyle(fontSize: 16, color: AppColor.primaryColor),
              ),
              const Spacer(),

              CustomContainerIcon(
                icon: Icons.favorite_border_rounded,
                onPressedIcon: onPressedFav,
              ),

              GetBuilder<NotificationController>(
                builder: (notifController) {
                  return badges.Badge(
                    showBadge: notifController.unreadCount > 0,
                   position: badges.BadgePosition.topEnd(top: -8, end: 5),
                    badgeContent: Text(
                      notifController.unreadCount.toString(),
                      style: const TextStyle(color: Colors.white, fontSize: 10),
                    ),
                    child: CustomContainerIcon(
                      icon: Icons.notifications_active_outlined,
                      onPressedIcon: () {
                        notifController.resetUnread();
                        Get.toNamed(AppRoute.notification);
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
