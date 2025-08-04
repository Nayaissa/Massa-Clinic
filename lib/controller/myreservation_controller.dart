import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:massaclinic/core/class/diohelper.dart';
import 'package:massaclinic/core/class/statusrequest.dart';
import 'package:massaclinic/core/constant/AppColor.dart';
import 'package:massaclinic/data/model/Login_model.dart';
import 'package:massaclinic/data/model/reservation_model.dart';
import 'package:massaclinic/data/model/status_model.dart';

class BookingsController extends GetxController {
  StatusRequest? addBookState;
  StatusRequest? showStatus;
  StatusRequest? reservationStatusRequest;
  StatusesModel? statusesModel;
  ReservationsModel? reservationsModel;
  LoginModel? loginModel;
  @override
  void onInit() {
    getStatus();
    getReservation(selectedTab);
    super.onInit();
  }

  String selectedTab = 'pending';

  void changeTab(String tab) {
    selectedTab = tab;
    getReservation(selectedTab);
    update();
  }

  addReservation(String id) {
    addBookState = StatusRequest.loading;
    update();

    DioHelper.postsData(url: '/api/reservations', data: {'service_id': id})
        .then((value) {
          if (value!.statusCode == 200 || value.statusCode == 201) {
            addBookState = StatusRequest.success;

            loginModel = LoginModel.fromJson(value.data);
           Get.defaultDialog(
        title: "Congratulations",
        titleStyle: TextStyle(
          color: AppColor.gery800,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
        middleText: loginModel!.message!.substring(0, 32),
        middleTextStyle: TextStyle(
          color: AppColor.primaryColor,
          fontSize: 14,
        ),
        backgroundColor: AppColor.thirdColor,
        confirm: TextButton(
          onPressed: () => Get.back(),
          child: Text(
            "OK",
            style: TextStyle(
              color: AppColor.gery800,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );

      update();
    } else {
      loginModel = LoginModel.fromJson(value.data);
      Get.defaultDialog(
        title: "Warning",
        titleStyle: TextStyle(
          color: AppColor.gery800,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
        middleText: loginModel!.message!.substring(0, 39),
        middleTextStyle: TextStyle(
          color: AppColor.primaryColor,
          fontSize: 14,
        ),
        backgroundColor: AppColor.thirdColor,
        confirm: TextButton(
          onPressed: () => Get.back(),
          child: Text(
            "OK",
            style: TextStyle(
              color: AppColor.gery800,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );
            addBookState = StatusRequest.noData;
          }
          update();
        })
        .catchError((error) {
          print(error.toString());
          addBookState = StatusRequest.serverfailure;
          update();
        });
  }

  // get status
  getStatus() {
    showStatus = StatusRequest.loading;
    update();

    DioHelper.getDataa(url: '/api/reservation-statuses')
        .then((value) {
          print(value!.data);
          if (value.statusCode == 200) {
            showStatus = StatusRequest.success;
            statusesModel = StatusesModel.fromJson(value.data);
            update();
          } else {
            showStatus = StatusRequest.noData;
          }
          update();
        })
        .catchError((error) {
          print(error.toString());
          addBookState = StatusRequest.serverfailure;
          update();
        });
  }

  // get my reservation
  getReservation(String state) {
    reservationStatusRequest = StatusRequest.loading;
    update();

    DioHelper.getDataa(url: '/api/user/reservations/status/$state')
        .then((value) {
          print(value!.data);
          if (value.statusCode == 200) {
            reservationStatusRequest = StatusRequest.success;
            print('nayayyayy');
            reservationsModel = ReservationsModel.fromJson(value.data);
            if (reservationsModel!.reservation!.isEmpty ||
                reservationsModel!.reservation == null) {
              reservationStatusRequest = StatusRequest.noData;
            }
            update();
          } else {
            reservationStatusRequest = StatusRequest.noData;
          }
          update();
        })
        .catchError((error) {
          print(error.toString());
          reservationStatusRequest = StatusRequest.serverfailure;
          update();
        });
  }
}
