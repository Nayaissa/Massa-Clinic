import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:massaclinic/controller/myreservation_controller.dart';
import 'package:massaclinic/core/constant/AppColor.dart';
import 'package:massaclinic/data/model/reservation_model.dart';
import 'package:massaclinic/view/widget/reservation/custom_text.dart';
import 'package:massaclinic/view/screen/payment/payment_flow_screen.dart';

class CustomBookCard extends GetView<BookingsController> {
  const CustomBookCard({super.key, required this.booking});
  final Data booking;
  @override
  Widget build(BuildContext context) {
    final isUpcoming = booking.status == 'pending';
    final isCompleted = booking.status == 'confirmed';
    final isOverdue = booking.status == 'overdue';
    // add color
    Color statusColor =
        isUpcoming
            ? Colors.orangeAccent
            : isCompleted
            ? Colors.green
            : isOverdue
            ? Colors.red
            : Colors.grey;

    // DateTime? dateTime;
    // try {
    //   dateTime = DateTime.parse(booking.createdAt!);
    // } catch (e) {
    //   dateTime = null;
    // }

    // String formattedDate =
    //     dateTime != null
    //         ? "${dateTime.year}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.day.toString().padLeft(2, '0')}"
    //         : "N/A";

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
                '#${booking.reservationId}',
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

              // if (isCompleted)
              SizedBox(width: 5),
              Text(
                booking.reservationDate ?? '',
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
            satate: true,
            content: 'Type : ${booking.classificationName!}',
          ),

          SizedBox(height: 5),

          CustomTextReservationCard(
            iconData: FontAwesomeIcons.seedling,
            satate: true,
            content: 'Service Name : ${booking.serviceName!}',
          ),

          SizedBox(height: 5),
          Row(
            children: [
              CustomTextReservationCard(
                iconData: Icons.numbers_outlined,
                satate: true,
                content: 'Session Name :${booking.sessionName}',
              ),
              Spacer(),
              Text(
                '${booking.sessionPrice}',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                  color: Colors.green,
                ),
              ),
            ],
          ),

          // Payment information for overdue reservations
          if (isOverdue && booking.paymentInfo != null) ...[
            SizedBox(height: 12),
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.red.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.red.withOpacity(0.3)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.payment, color: Colors.red, size: 20),
                      SizedBox(width: 8),
                      Text(
                        'Payment Required',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Required Amount:', style: TextStyle(fontWeight: FontWeight.w600)),
                      Text('${booking.paymentInfo!.requiredAmount} SY', 
                           style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red)),
                    ],
                  ),
                  SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Your Balance:', style: TextStyle(fontWeight: FontWeight.w600)),
                      Text('${booking.paymentInfo!.userBalance} SY', 
                           style: TextStyle(fontWeight: FontWeight.bold, 
                           color: booking.paymentInfo!.canAfford! ? Colors.green : Colors.red)),
                    ],
                  ),
                  if (booking.paymentInfo!.shortfall! > 0) ...[
                    SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Shortfall:', style: TextStyle(fontWeight: FontWeight.w600)),
                        Text('${booking.paymentInfo!.shortfall} SY', 
                             style: TextStyle(fontWeight: FontWeight.bold, color: Colors.orange)),
                      ],
                    ),
                  ],
                ],
              ),
            ),
          ],

          SizedBox(height: 16),
          Row(
            children: [
              if (booking.status == 'pending') ...[
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      controller.cancleReservationPending(
                        booking.reservationId.toString(),
                      );
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
                SizedBox(width: 12),
                booking.buttons!.confirmEnabled == true
                    ? Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          controller.confirmByUser(
                            booking.reservationId.toString(),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColor.secondaryColor,
                          padding: EdgeInsets.symmetric(vertical: 8),
                        ),
                        child: Text(
                          "Confirm",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    )
                    : SizedBox(),
              ] else if (booking.status == 'confirmed') ...[
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      controller.cancleReservationConfirmed(
                        booking.reservationId.toString(),
                      );
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
                      controller.postponReservation(
                        booking.reservationId.toString(),
                      );
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
              ] else if (booking.status == 'overdue') ...[
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      controller.cancleReservationPending(
                        booking.reservationId.toString(),
                      );
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
                SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      _handleOverduePayment(context, booking);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      padding: EdgeInsets.symmetric(vertical: 8),
                    ),
                    child: Text(
                      "Pay Now",
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

  void _handleOverduePayment(BuildContext context, Data booking) {
    if (booking.paymentInfo?.canAfford == true) {
      // User has sufficient balance, proceed with direct payment
      controller.payForOverdueReservation(booking.reservationId.toString());
    } else {
      // User has insufficient balance, navigate to payment flow
      Get.to(() => PaymentFlowScreen(
        servicePrice: booking.paymentInfo?.requiredAmount ?? booking.sessionPrice ?? 0.0,
        serviceName: booking.serviceName ?? 'Service',
        reservationId: booking.reservationId,
        onPaymentSuccess: () {
          // Refresh the reservations list after successful payment
          controller.getReservation('overdue');
          controller.getReservation('confirmed');
        },
      ));
    }
  }
}


// String formattedTime = dateTime != null
  //     ? "${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}"
  //     : "N/A";
  
  // String statusText =
  //     isUpcoming ? "Upcoming" : isCompleted ? "Completed" : "Canceled";