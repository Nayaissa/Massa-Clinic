import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:massaclinic/controller/myreservation_controller.dart';
import 'package:massaclinic/core/class/statusrequest.dart';
import 'package:massaclinic/core/constant/AppColor.dart';
import 'package:massaclinic/core/constant/AppImagesAssets.dart';
import 'package:massaclinic/view/widget/reservation/custom_book_card.dart';
import 'package:massaclinic/view/widget/reservation/customappar.dart';
import 'package:massaclinic/view/widget/reservation/customtapparclassication.dart';

class Reservations extends StatelessWidget {
  Reservations({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(BookingsController());

    return GetBuilder<BookingsController>(
      builder: (controller) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: AppColor.backgroundColor,

            body: Column(
              children: [
                CustomApparReservation(
                  title: 'Reservations',
                  icon: Icons.arrow_back_ios_new,
                ),
                SizedBox(height: 10),

                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 40,
                      child: ListView.builder(
                        padding: EdgeInsets.symmetric(horizontal: 25),
                        scrollDirection: Axis.horizontal,
                        itemCount:
                            controller.statusesModel?.statuses?.length ?? 0,
                        itemBuilder: (context, index) {
                          final states =
                              controller.statusesModel?.statuses?[index];
                          bool isSelected = controller.selectedTab == states;
                          return CustomStateReservation(
                            onTap: () {
                              controller.changeTab(states!);
                            },
                            color:
                                isSelected
                                    ? AppColor.secondaryColor
                                    : Colors.white,
                            colortext:
                                isSelected ? Colors.white : AppColor.gery800,
                            tab: states,
                          );
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Expanded(
                  child:
                      controller.reservationStatusRequest ==
                              StatusRequest.loading
                          ? Center(
                            child: Lottie.asset(
                              AppImageAssets.loding,
                              width: 200,
                              height: 150,
                            ),
                          )
                          : ListView.builder(
                            itemCount:
                                controller
                                    .reservationsModel!
                                    .data!
                                    .length,
                            itemBuilder: (context, index) {
                              final booking =
                                  controller
                                      .reservationsModel!
                                      .data![index];
                              return CustomBookCard(booking: booking);
                            },
                          ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
