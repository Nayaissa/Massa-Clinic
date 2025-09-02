import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:massaclinic/controller/archive_controller.dart';
import 'package:massaclinic/core/class/statusrequest.dart';
import 'package:massaclinic/core/constant/AppColor.dart';
import 'package:massaclinic/core/constant/AppImagesAssets.dart';
import 'package:massaclinic/core/constant/routes.dart';
import 'package:massaclinic/view/widget/reservation/customappar.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

enum SessionStatus { completed, confirmed, notCompleted ,pending}



class ArchivePage extends StatelessWidget {
  const ArchivePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ArchiveControllerImp());
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: Column(
        children: [
          CustomApparReservation(icon: Icons.arrow_back_ios, title: 'Archive'),
          GetBuilder<ArchiveControllerImp>(
            builder: (controller) {
              return 
                 controller.statusRequest == StatusRequest.loading ?
                  Center(child:  Lottie.asset(AppImageAssets.loding,repeat: true ,width: 250,height: 200),)
                   :
              Expanded(
                child: ListView.separated(
                  itemCount: controller.archiveModdel!.data!.length,
                  separatorBuilder: (context, index) {
                    return SizedBox(height: 10);
                  },
                  itemBuilder: (context, index) {
                    final itemArchive = controller.archiveModdel!.data![index];
                    return BookingCard(
                      archiveId:  itemArchive.serviceId!,
                      imagePath: itemArchive.serviceImage!,
                      title: itemArchive.serviceName!,
                      price: itemArchive.servicePrice!,
                      completedSessions: itemArchive.completedSessionsCount!,
                      totalSessions: itemArchive.totalSessions!,
                      //  sessionStatusText: itemArchive.!
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

class BookingCard extends StatelessWidget {
  final int archiveId; 

  final String imagePath;
  final String title;
  // final String date;
  final String price;
  final int completedSessions;
  final int totalSessions;
  // final String sessionStatusText;

  const BookingCard({
    super.key,
    required this.imagePath,
    required this.title,
    // required this.date,
    required this.price,
    required this.completedSessions,
    required this.totalSessions, required this.archiveId,
    // required this.sessionStatusText,
  });

  @override
  Widget build(BuildContext context) {
    double percent = completedSessions / totalSessions;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(width: 2, color: AppColor.secondaryColor),
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              imagePath,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColor.primaryColor,
                    fontSize: 16,
                  ),
                ),
    
                const SizedBox(height: 4),
                Text(
                  "Price: ${price}\$",
                  style: const TextStyle(
                    fontSize: 15,
                    color: AppColor.primaryColor,
                    fontWeight: FontWeight.w100,
                  ),
                ),
                const SizedBox(height: 8),
                Text('Next Session:', style: const TextStyle(fontSize: 13)),
                const SizedBox(height: 4),
                Text(
                  '2025/9/10 : 03:00',
                  style: const TextStyle(fontSize: 15),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Column(
            children: [
              CircularPercentIndicator(
                radius: 28,
                lineWidth: 6,
                percent: percent,
                progressColor: Colors.green,
                backgroundColor: const Color.fromARGB(255, 179, 178, 178),
                center: Text(
                  "$completedSessions/$totalSessions",
                  style: const TextStyle(
                    fontSize: 14,
                    color: AppColor.gery800,
                  ),
                ),
              ),
    
              SizedBox(
                width: 80,
                child: ElevatedButton(
                  onPressed: () {
                    Get.toNamed(AppRoute.appointment,arguments: {
                      'id':archiveId.toString(),
                    } );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.thirdColor,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    minimumSize: const Size(0, 30),
                  ),
                  child: const Text(
                    "Details",
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColor.primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
