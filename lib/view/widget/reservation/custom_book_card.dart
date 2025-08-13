import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:massaclinic/core/constant/AppColor.dart';
import 'package:massaclinic/data/model/reservation_model.dart';
import 'package:massaclinic/view/widget/reservation/custom_text.dart';

class CustomBookCard extends StatelessWidget {
  const CustomBookCard({super.key, required this.booking});
  final Reservation booking;
  @override
  Widget build(BuildContext context) {
    final isUpcoming = booking.status == 'pending';
    final isCompleted = booking.status == 'confirmed';
    // add color
    Color statusColor =
        isUpcoming
            ? Colors.orangeAccent
            : isCompleted
            ? Colors.green
            : Colors.red;

    DateTime? dateTime;
    try {
      dateTime = DateTime.parse(booking.createdAt!);
    } catch (e) {
      dateTime = null;
    }

    String formattedDate =
        dateTime != null
            ? "${dateTime.year}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.day.toString().padLeft(2, '0')}"
            : "N/A";

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
              Text(
                "Reservation Number:",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColor.gery800,
                  fontSize: 16,
                ),
              ),
              SizedBox(width: 6),
              Text(
                '${'#' + booking.id.toString()}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColor.gery800,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          SizedBox(height: 3),
          Row(
            children: [
              Icon(
                Icons.calendar_month_rounded,
                size: 20,
                color: AppColor.primaryColor,
              ),
              SizedBox(width: 5),
              Text(
                formattedDate,
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

          SizedBox(height: 5),
          CustomTextReservationCard(
            iconData: Icons.info_outline,
            content: "Status: ${booking.status}",
            satate: false,
            color: statusColor,
          ),

          SizedBox(height: 5),

          CustomTextReservationCard(
            iconData: Icons.label_important_outline,
            content: '${'Type : ' + booking.service!.classification!.title!}',
          ),

          SizedBox(height: 5),

          CustomTextReservationCard(
            iconData: FontAwesomeIcons.seedling,
            content: '${'Service Name : ' + booking.service!.name! + ''}',
          ),

          SizedBox(height: 5),
          Row(
            children: [
              CustomTextReservationCard(
                iconData: Icons.numbers_outlined,
                content: 'Session Number : First session',
              ),
              Spacer(),
              Text(
                '30\$',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                  color: Colors.green,
                ),
              ),
            ],
          ),

          SizedBox(height: 16),
          Row(
            children: [
              if (booking.status == 'pending') ...[
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                    },
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: AppColor.primaryColor),
                    ),
                    child: Text(
                      "Cancel Booking",
                      style: TextStyle(color: AppColor.primaryColor),
                    ),
                  ),
                ),
              ] else if (booking.status == 'confirmed') ...[
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                    },
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: AppColor.primaryColor),
                    ),
                    child: Text(
                      "Delete Booking",
                      style: TextStyle(color: AppColor.primaryColor),
                    ),
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.secondaryColor,
                      padding: EdgeInsets.symmetric(vertical: 8),
                    ),
                    child: Text(
                      "Reschedule",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ] else if (booking.status == 'canceled') ...[
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.secondaryColor,
                      padding: EdgeInsets.symmetric(vertical: 8),
                    ),
                    child: Text(
                      "Book Again",
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


// String formattedTime = dateTime != null
  //     ? "${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}"
  //     : "N/A";
  
  // String statusText =
  //     isUpcoming ? "Upcoming" : isCompleted ? "Completed" : "Canceled";