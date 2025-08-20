import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:massaclinic/controller/complaint_controller.dart';
import 'package:massaclinic/core/class/statusrequest.dart';
import 'package:massaclinic/core/constant/AppColor.dart';
import 'package:massaclinic/core/constant/AppImagesAssets.dart';
import 'package:massaclinic/core/constant/routes.dart';
import 'package:massaclinic/view/widget/complaints/compaints_card.dart';
import 'package:massaclinic/view/widget/complaints/recent_complaints_heder.dart';
import 'package:massaclinic/view/widget/complaints/new_complaints_button.dart';
import 'package:massaclinic/view/widget/reservation/customappar.dart';

class ComplaintPage extends StatelessWidget {
  const ComplaintPage({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(ComlaintControllerImp());

    return Scaffold(
      backgroundColor: AppColor.backgroundColor,

      body: SafeArea(
        child: Column(
          children: [
            CustomApparReservation(
              icon: Icons.arrow_back_ios_new_outlined,
              title: 'Complaints',
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: GetBuilder<ComlaintControllerImp>(
                  builder: (controller) {
                    return Column(
                      children: [
                        const SizedBox(height: 16),
                        NewComplaintButton(
                          onPressed: () {
                            Get.toNamed(AppRoute.addcomplaints);
                          },
                          text: 'New Complaint',
                          colorbutton: AppColor.thirdColor,
                        ),
                        const SizedBox(height: 16),
                        const SizedBox(height: 24),
                        RecentComplaintsHeader(),
                        const SizedBox(height: 12),
                        controller.complaintStatusRequest ==
                                StatusRequest.loading
                            ? Center(
                              child: Lottie.asset(
                                AppImageAssets.loding,
                                height: 150,
                                repeat: true,
                              ),
                            )
                            : controller.complaintStatusRequest ==
                                StatusRequest.noData
                            ? Center(
                              child: Lottie.asset(
                                AppImageAssets.noData,
                                height: 150,
                              ),
                            )
                            : ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount:
                                  controller.complaintModel?.data?.length ?? 0,
                              itemBuilder: (context, index) {
                                final item =
                                    controller.complaintModel!.data![index];
                                return ComplaintCard(
                                  title: item.content!,
                                  status: item.status!,
                                  color: Colors.orange,
                                  personImage: item.user!.imageUrl,
                                  personName: item.user!.name,
                                  created: item.createdAt!.substring(0, 10),
                                  onDelete: () {
                                    controller.deleteComplaints(
                                      item.id.toString(),
                                    );
                                  },
                                );
                              },
                            ),

                        SizedBox(height: 20),
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
