import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:massaclinic/controller/customer_notification_controller.dart';
import 'package:massaclinic/core/class/statusrequest.dart';
import 'package:massaclinic/core/constant/AppColor.dart';
import 'package:massaclinic/core/constant/AppImagesAssets.dart';
import 'package:massaclinic/view/widget/custom_notification_card.dart';
import 'package:massaclinic/view/widget/reservation/customappar.dart';


class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CustomerNotificationController());
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: SafeArea(
        child: ListView(
          children: [
            CustomApparReservation(
              icon: Icons.arrow_back_ios,
              title: 'Notifications',
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: GetBuilder<CustomerNotificationController>(
                builder: (controller) {
                  return 
                    controller.statusRequest== StatusRequest.loading ?LottieBuilder.asset(AppImageAssets.loding,repeat: true,height: 200,)   :
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      final itemNotification = controller.notificationModel!.data![index];
                      return NotificationCard(
                        title:itemNotification.title! ,
                        subtitle: itemNotification.body!,
                         time: itemNotification.timeAgo!,
                        onTap: () {},
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(height: 10);
                    },
                    itemCount:  controller.notificationModel!.data!.length,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
