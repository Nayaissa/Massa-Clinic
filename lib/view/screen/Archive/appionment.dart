import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:massaclinic/controller/session_controller.dart';
import 'package:massaclinic/core/class/statusrequest.dart';
import 'package:massaclinic/core/constant/AppColor.dart';
import 'package:massaclinic/core/constant/AppImagesAssets.dart';
import 'package:massaclinic/view/screen/Archive/archive.dart';
import 'package:massaclinic/view/widget/reservation/customappar.dart';

class AppointmentsPage extends StatelessWidget {
  // final List<SessionModel>? sessions;

  const AppointmentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SessionControllerImp());
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: Column(
        children: [
          CustomApparReservation(
            title: 'Sessions',
            icon: Icons.arrow_back_ios_new,
          ),
          const SizedBox(height: 10),
          GetBuilder<SessionControllerImp>(
            builder: (controller) {
             return  controller.seesionStatusRequest== StatusRequest.loading ?
                  Center(child:  Lottie.asset(AppImageAssets.loding,repeat: true ,width: 250,height: 200),)
                   :
               Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.sessionModel!.sessions!.length,
                  itemBuilder: (context, index) {
                    final session = controller.sessionModel!.sessions![index];

                    late Icon statusIcon;
                    late Color statusColor;

                    if (session.status == SessionStatus.completed) {
                      statusIcon = const Icon(
                        Icons.check_circle,
                        color: Colors.green,
                      );
                      statusColor = Colors.green.shade50;
                    } else if (session.status == SessionStatus.confirmed) {
                      statusIcon = const Icon(
                        Icons.access_time_filled,
                        color: Colors.blue,
                      );
                      statusColor = Colors.orange.shade50;
                    } else if(session.status == SessionStatus.confirmed) {
                     statusIcon = const Icon(
                        Icons.access_time_filled,
                        color: Colors.orange,
                      );
                    }else{
                        statusIcon = const Icon(Icons.cancel, color: Colors.red);
                      statusColor = Colors.grey.shade100;
                    }

                    return Card(
                      color: statusColor,
                      margin: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Row(
                          children: [
                            Column(children: [statusIcon]),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    session.sessionName!,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    "Price: \$${session.price!.toStringAsFixed(2)}",
                                  ),
                                ],
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColor.thirdColor,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 8,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                minimumSize: const Size(0, 30),
                              ),
                              child: Text(
                                "Book",
                                style: TextStyle(color: AppColor.primaryColor),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
