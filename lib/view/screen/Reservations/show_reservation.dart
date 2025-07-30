import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:massaclinic/controller/myreservation_controller.dart';
import 'package:massaclinic/core/constant/AppColor.dart';
import 'package:massaclinic/data/model/Booking_model.dart';
import 'package:massaclinic/view/widget/reservation/customappar.dart';
import 'package:massaclinic/view/widget/reservation/customtapparclassication.dart';

class Reservations extends StatelessWidget {
  Reservations({super.key});
  final List<String> tabs = ['Upcoming', 'Completed', 'Canceled'];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BookingsController>(
      init: BookingsController(),
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

                SizedBox(
                  height: 40,
                  child: ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 25),

                    scrollDirection: Axis.horizontal,
                    itemCount: tabs.length,
                    itemBuilder: (context, index) {
                      bool isSelected = controller.selectedTab == tabs[index];
                      return CustomStateReservation(
                        onTap: () {
                          controller.changeTab(tabs[index]);
                        },
                        color:  isSelected ? AppColor.secondaryColor : Colors.white,
                        colortext:  isSelected ? Colors.white : AppColor.gery800,
                        tab:tabs[index]
                      );
                    },
                  ),
                ),
                SizedBox(height: 10),
                Expanded(
                  child:
                      controller.filteredBookings.isEmpty
                          ? Center(child: Text("No bookings found"))
                          : ListView.builder(
                            itemCount: controller.filteredBookings.length,
                            itemBuilder: (context, index) {
                              final booking =
                                  controller.filteredBookings[index];
                              return bookingCard(booking);
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

  Widget bookingCard(BookingModel booking) {
    final isUpcoming = booking.isUpcoming;
    final isCompleted = booking.isCompleted;

    String statusText =
        isUpcoming
            ? "Upcoming"
            : isCompleted
            ? "Completed"
            : "Canceled";
    Color statusColor =
        isUpcoming
            ? Colors.orangeAccent
            : isCompleted
            ? Colors.green
            : Colors.red;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: Colors.grey.shade300, blurRadius: 6)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.calendar_month_rounded,
                size: 20,
                color: AppColor.primaryColor,
              ),
              SizedBox(width: 5),
              Text(
                booking.date,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  color: AppColor.gery800,
                ),
              ),
              Spacer(),
              if (isCompleted)
                Icon(Icons.check_box_rounded, color: Colors.blueAccent),
            ],
          ),
          Row(
            children: [
              SizedBox(width: 25),
              Text(
                booking.time,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 10,
                  color: AppColor.secondaryColor,
                ),
              ),
            ],
          ),

          SizedBox(height: 5),
          Row(
            children: [
              Icon(Icons.info_outline, size: 18, color: statusColor),
              SizedBox(width: 6),
              Text(
                "Status: $statusText",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: statusColor,
                ),
              ),
            ],
          ),

          SizedBox(height: 5),
          Row(
            children: [
              Icon(
                Icons.label_important_outline,
                size: 20,
                color: AppColor.primaryColor,
              ),
              const SizedBox(width: 8),
              Text(
                booking.categoryName,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                  color: AppColor.gery800,
                ),
              ),
            ],
          ),
          SizedBox(height: 5),
          Row(
            children: [
              Icon(
                FontAwesomeIcons.seedling,
                size: 18,
                color: AppColor.primaryColor,
              ),
              const SizedBox(width: 8),

              Text(
                booking.serviceName,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: AppColor.gery800,
                ),
              ),
            ],
          ),
      
          SizedBox(height: 16),
          Row(
            children: [
              if (isCompleted)
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.secondaryColor,
                      padding: EdgeInsets.symmetric(vertical: 8),
                    ),
                    child: Text(
                      "Details",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )
              else ...[
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: AppColor.secondaryColor),
                    ),
                    child: Text(
                      isUpcoming ? "Cancel Booking" : "Details",
                      style: TextStyle(color: AppColor.secondaryColor),
                    ),
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.secondaryColor,
                      padding: EdgeInsets.symmetric(vertical: 8),
                    ),
                    child: Text(
                      isUpcoming ? "View Details" : "Book Again",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}
