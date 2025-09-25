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
   ComlaintControllerImp controllerImp= Get.put(ComlaintControllerImp());

void showEditDialog(BuildContext context, ComlaintControllerImp controller, String complaintId, String currentContent) {
  TextEditingController editController = TextEditingController(text: currentContent);

 showDialog(
  context: context,
  builder: (context) {
    return Dialog(
      // backgroundColor: AppColor.thirdColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20), 
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "Edit Complaint",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: editController,
              maxLines: 4,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[100],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
                hintText: "Enter new content",
                
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () => Get.back(),
                  child: const Text(
                    "Cancel",
                    style: TextStyle(fontSize: 16,color:AppColor.primaryColor),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    controllerImp.editComplaint(complaintId, editController.text);
                    Get.back();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.thirdColor, 
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    elevation: 3,
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  ),
                  child: const Text(
                    "Save",
                    style: TextStyle(fontSize: 16, color: AppColor.primaryColor),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  },
);

}
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,

      body: SafeArea(
        child: Column(
          children: [
            CustomApparReservation(
              icon: Icons.arrow_back_ios_new_outlined,
              title: '92'.tr,
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
                          text: '141'.tr,
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
                                  onEdit: () {
                                 showEditDialog(context, controller, item.id.toString(), item.content!);

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
