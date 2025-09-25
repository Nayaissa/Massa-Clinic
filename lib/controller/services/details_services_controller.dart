import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:massaclinic/core/class/diohelper.dart';
import 'package:massaclinic/core/class/statusrequest.dart';
import 'package:massaclinic/data/model/doctor_model.dart';
import 'package:massaclinic/data/model/specialists_model.dart';
import 'package:massaclinic/view/screen/payment/payment_flow_screen.dart';

abstract class DetailsServicreController extends GetxController {}

class DetailsServicreControllerImp extends DetailsServicreController {
  DoctorModel? doctorModel;
  SpecialistsModel? specialistsModel;
  StatusRequest? doctorStatusRequest;
  StatusRequest? speclistsStatusRequest;
  String? name;
  String? image;
  String? desc;
  String? price;
  String? id;
  int? totalSession;

  @override
  void onInit() {
    // getSpeclistsByServices();
    // getDoctorByServices();
    super.onInit();
  }

  void setServiceDetails(String n, String i, String d, String p, String idser,int t) {
    name = n;
    image = i;
    desc = d;
    price = p;
    id = idser;
    totalSession = t;

    getSpeclistsByServices();
    getDoctorByServices();
    update();
  }

  getDoctorByServices() {
    doctorStatusRequest = StatusRequest.loading;
    update();

    DioHelper.getDataa(url: '/api/services/$id/doctors')
        .then((value) {
          if (value != null) {
            if (value.statusCode == 200) {
              doctorStatusRequest = StatusRequest.success;

              doctorModel = DoctorModel.fromJson(value.data);

              if (doctorModel!.data == null) {
                doctorStatusRequest = StatusRequest.noData;
              }
              update();
            } else {
              doctorStatusRequest = StatusRequest.noData;
            }
            update();
          } else {
            doctorStatusRequest = StatusRequest.serverfailure;
            update();
          }
        })
        .catchError((error) {
          doctorStatusRequest = StatusRequest.serverfailure;
          update();
        });
  }

  getSpeclistsByServices() {
    speclistsStatusRequest = StatusRequest.loading;
    update();

    DioHelper.getDataa(url: '/api/services/$id/specialists')
        .then((value) {
          if (value != null) {
            if (value.statusCode == 200) {
              speclistsStatusRequest = StatusRequest.success;

              specialistsModel = SpecialistsModel.fromJson(value.data);

              if (specialistsModel!.data == null) {
                speclistsStatusRequest = StatusRequest.noData;
              }
              update();
            } else {
              speclistsStatusRequest = StatusRequest.noData;
            }
            update();
          } else {
            speclistsStatusRequest = StatusRequest.serverfailure;
            update();
          }
        })
        .catchError((error) {
          doctorStatusRequest = StatusRequest.serverfailure;
          update();
        });
  }


  // Book service (no payment required at booking)
  void bookService() {
    // Create reservation directly without payment
    createReservation();
  }

  // Create reservation (no payment required at booking)
  void createReservation() {
    DioHelper.postsData(
      url: '/api/reservations',
      data: {
        'service_id': id,
      },
    ).then((value) {
      if (value != null && (value.statusCode == 200 || value.statusCode == 201)) {
        // Show success dialog
        Get.dialog(
          AlertDialog(
            title: const Text('Booking Successful!'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Your appointment has been booked successfully.'),
                const SizedBox(height: 8),
                Text('Service: $name'),
                const SizedBox(height: 8),
                const Text(
                  'Payment will be required when your appointment is confirmed by the secretary.',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.orange,
                  ),
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Get.back(); // Close dialog
                  Get.back(); // Go back to previous screen
                },
                child: const Text('OK'),
              ),
            ],
          ),
          barrierDismissible: false,
        );
      } else {
        Get.snackbar('Error', value?.data['message'] ?? 'Failed to create reservation');
      }
    }).catchError((error) {
      Get.snackbar('Error', 'Failed to create reservation');
    });
  }

}
