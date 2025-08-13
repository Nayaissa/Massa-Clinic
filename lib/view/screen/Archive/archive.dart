import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:massaclinic/core/constant/AppColor.dart';
import 'package:massaclinic/view/screen/Archive/appionment.dart';
import 'package:massaclinic/view/widget/reservation/customappar.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
enum SessionStatus { completed, confirmed, notCompleted }

class SessionModel {
  final String name;
  final double price;
  final SessionStatus status;

  SessionModel({
    required this.name,
    required this.price,
    required this.status,
  });
}
List<SessionModel> sessions = [
  SessionModel(name: 'Session 1', price: 100, status: SessionStatus.completed),
  SessionModel(name: 'Session 2', price: 100, status: SessionStatus.confirmed),
  SessionModel(name: 'Session 3', price: 100, status: SessionStatus.notCompleted),
  SessionModel(name: 'Session 4', price: 100, status: SessionStatus.notCompleted),
  SessionModel(name: 'Session 5', price: 100, status: SessionStatus.notCompleted),
];


class BookingModel {
  final String serviceName;
  final String serviceImage;
  final String bookingDate;
  final double totalPrice;
  final double paidAmount;
  final int totalSessions;
  final int completedSessions;
  final List<SessionModel> sessions;

  BookingModel({
    required this.serviceName,
    required this.serviceImage,
    required this.bookingDate,
    required this.totalPrice,
    required this.paidAmount,
    required this.totalSessions,
    required this.completedSessions,
    required this.sessions,
  });
}

class ArchivePage extends StatelessWidget {
  const ArchivePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 12),
        children: const [
          CustomApparReservation(
            title: 'Archive',
            icon: Icons.arrow_back_ios_new,
          ),
          BookingCard(
            imagePath: 'assets/images/laserface.jpeg',
            title: 'Laser',
            date: '2025-08-06',
            price: '500.00',
            completedSessions: 3,
            totalSessions: 5,
            sessionStatusText: 'Complete Session',
          ),
          BookingCard(
            imagePath: 'assets/images/fillerface.jpeg',
            title: 'Filler',
            date: '2025-08-08',
            price: '300.00',
            completedSessions: 4,
            totalSessions: 4,
            sessionStatusText: 'Complete Session ',
          ),
          BookingCard(
            imagePath: 'assets/images/botoksface.jpeg',
            title: 'Botox',
            date: '2025-08-08',
            price: '300.00',
            completedSessions: 2,
            totalSessions: 4,
            sessionStatusText: 'Complete Session',
          ),
        ],
      ),
    );
  }
}

class BookingCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String date;
  final String price;
  final int completedSessions;
  final int totalSessions;
  final String sessionStatusText;

  const BookingCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.date,
    required this.price,
    required this.completedSessions,
    required this.totalSessions,
    required this.sessionStatusText,
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
          BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 4)),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        // textDirection: TextDirection.rtl,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              imagePath,
              width: 80,
              height: 80,
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
                Text('2025/9/10 : 03:00', style: const TextStyle(fontSize: 15)),
                // LinearProgressIndicator(
                //   value: percent,
                //   minHeight: 6,
                //   backgroundColor: Colors.grey.shade300,
                //   color: Colors.green,
                //   borderRadius: BorderRadius.circular(10),
                // ),
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
                  style: const TextStyle(fontSize: 14, color: AppColor.gery800),
                ),
              ),

              SizedBox(
                width: 80,
                child: ElevatedButton(
                  onPressed: () {
                    Get.to(AppointmentsPage(sessions: sessions));
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
