import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:massaclinic/core/class/diohelper.dart';
import 'package:massaclinic/core/class/statusrequest.dart';
import 'package:massaclinic/core/constant/AppColor.dart';
import 'package:massaclinic/data/model/Login_model.dart';
import 'package:massaclinic/data/model/addreservation_code_model.dart';
import 'package:massaclinic/data/model/reservation_model.dart';
import 'package:massaclinic/data/model/status_model.dart';

class BookingsController extends GetxController {
  StatusRequest? addBookState;
  StatusRequest? showStatus;
  StatusRequest? reservationStatusRequest;
  StatusRequest? cancelStatusRequest;
  StatusRequest? confirmStatusRequest;
  StatusRequest? postponeStatusRequest;
  StatusRequest? deleteStatusRequest;

  StatusesModel? statusesModel;
    
AddReservationCodeModel? addReservationCodeModel;

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

  addReservation(String id,String couponCode) {
    addBookState = StatusRequest.loading;
    update();

     DioHelper.postsData(url: '/api/reservations', data: {'service_id': id}
    ,query: {'coupon_code': couponCode   })
        .then((value) {
          if (value!.statusCode == 200 || value.statusCode == 201) {
            addBookState = StatusRequest.success;

              addBookState = StatusRequest.success;
// تمت اضافة كوبون وتعديل الرساللة لعرض نيو برايس
            addReservationCodeModel = AddReservationCodeModel.fromJson(value.data);
            // Get.defaultDialog(
            //   title: "Congratulations",
            //   titleStyle: TextStyle(
            //     color: AppColor.gery800,
            //     fontWeight: FontWeight.bold,
            //     fontSize: 16,
            //   ),
            //   middleText: loginModel!.message!,
            //   middleTextStyle: TextStyle(
            //     color: AppColor.primaryColor,
            //     fontSize: 14,
            //   ),
            //   backgroundColor: AppColor.thirdColor,
            //   confirm: TextButton(
            //     onPressed: () => Get.back(),
            //     child: Text(
            //       "OK",
            //       style: TextStyle(
            //         color: AppColor.gery800,
            //         fontWeight: FontWeight.bold,
            //       ),
            //     ),
            //   ),
            // );
//
Get.defaultDialog(
  title: "Congratulations",
  titleStyle: TextStyle(
    color: AppColor.gery800,
    fontWeight: FontWeight.bold,
    fontSize: 16,
  ),
  backgroundColor: AppColor.thirdColor,
  content: Column(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        loginModel!.message!,
        style: TextStyle(
          color: AppColor.primaryColor,
          fontSize: 14,
        ),
      ),
      SizedBox(height: 8),
      Text(
        "Old Price: ${addReservationCodeModel!.reservation!.service!.price}",
        style: TextStyle(
          color: Colors.red,
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
      ),
      Text(
        "New Price: ${addReservationCodeModel!.newPrice}",
        style: TextStyle(
          color: Colors.green,
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
      ),
      // Text(
      //   "Discount: ${loginModel!.discount}%",
      //   style: TextStyle(
      //     color: AppColor.gery800,
      //     fontSize: 14,
      //   ),
      // ),
    ],
  ),
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
            if (reservationsModel!.data!.isEmpty ||
                reservationsModel!.data == null) {
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

  cancleReservationPending(String id) async {
    cancelStatusRequest = StatusRequest.loading;
    update();

    await DioHelper.postsData(url: '/api/reservation/$id/cancel', data: {})
        .then((value) {
          print(value!.data);
          if (value.statusCode == 200 || value.statusCode == 201) {
            cancelStatusRequest = StatusRequest.success;
            loginModel = LoginModel.fromJson(value.data);
Get.showSnackbar(
  GetSnackBar(
    title: "Congratulations",
    message: loginModel!.message!,
    duration: Duration(seconds: 3),
    snackPosition: SnackPosition.BOTTOM, 
    backgroundColor: AppColor.thirdColor, 
  ),
);
            getReservation('pending');
            update();
          } else {
            cancelStatusRequest = StatusRequest.noData;
          }
          update();
        })
        .catchError((error) {
          print(error.toString());
          cancelStatusRequest = StatusRequest.serverfailure;
          update();
        });
  }
  confirmByUser(String id) async{
confirmStatusRequest = StatusRequest.loading;
    update();

    await DioHelper.postsData(url: '/api/reservation/$id/confirm', data: {})
        .then((value) {
          print(value!.data);
          if (value.statusCode == 200 || value.statusCode == 201) {
            confirmStatusRequest = StatusRequest.success;
            loginModel = LoginModel.fromJson(value.data);
Get.showSnackbar(
  GetSnackBar(
    title: "Congratulations",
    message: loginModel!.message!,
    duration: Duration(seconds: 3),
    snackPosition: SnackPosition.BOTTOM, 
    backgroundColor: AppColor.thirdColor, 
  ),
);
            getReservation('pending');
            update();
          } else {
            confirmStatusRequest = StatusRequest.noData;
          }
          update();
        })
        .catchError((error) {
          print(error.toString());
          confirmStatusRequest = StatusRequest.serverfailure;
          update();
        });
  }
  postponReservation(String id)async{
    postponeStatusRequest = StatusRequest.loading;
    update();

    await DioHelper.postsData(url: '/api/user/reservations/$id/postpone', data: {})
        .then((value) {
          print(value!.data);
          if (value.statusCode == 200 || value.statusCode == 201) {
            postponeStatusRequest = StatusRequest.success;
            loginModel = LoginModel.fromJson(value.data);
Get.showSnackbar(
  GetSnackBar(
    title: "Congratulations",
    message: loginModel!.message!,
    duration: Duration(seconds: 3),
    snackPosition: SnackPosition.BOTTOM, 
    backgroundColor: AppColor.thirdColor, 
  ),
);
            getReservation('pending');
            update();
          } else {
            postponeStatusRequest = StatusRequest.noData;
          }
          update();
        })
        .catchError((error) {
          print(error.toString());
          postponeStatusRequest = StatusRequest.serverfailure;
          update();
        });
  }
  cancleReservationConfirmed(String id) async{
      deleteStatusRequest = StatusRequest.loading;
    update();

    await DioHelper.postsData(url: '/api/user/reservations/$id/cancel', data: {})
        .then((value) {
          print(value!.data);
          if (value.statusCode == 200 || value.statusCode == 201) {
            deleteStatusRequest = StatusRequest.success;
            loginModel = LoginModel.fromJson(value.data);
Get.showSnackbar(
  GetSnackBar(
    title: "Congratulations",
    message: loginModel!.message!,
    duration: Duration(seconds: 3),
    snackPosition: SnackPosition.BOTTOM, 
    backgroundColor: AppColor.thirdColor, 
  ),
);
            getReservation('pending');
            update();
          } else {
            deleteStatusRequest = StatusRequest.noData;
          }
          update();
        })
        .catchError((error) {
          print(error.toString());
          deleteStatusRequest = StatusRequest.serverfailure;
          update();
        });
  }

  // Pay for overdue reservation
  void payForOverdueReservation(String id) async {
    confirmStatusRequest = StatusRequest.loading;
    update();

    await DioHelper.postsData(url: '/api/reservation/$id/confirm', data: {})
        .then((value) {
          print(value!.data);
          if (value.statusCode == 200 || value.statusCode == 201) {
            confirmStatusRequest = StatusRequest.success;
            loginModel = LoginModel.fromJson(value.data);
            Get.showSnackbar(
              GetSnackBar(
                title: "Payment Successful",
                message: loginModel!.message!,
                duration: Duration(seconds: 3),
                snackPosition: SnackPosition.BOTTOM, 
                backgroundColor: AppColor.thirdColor, 
              ),
            );
            getReservation('overdue');
            getReservation('confirmed');
            update();
          } else {
            confirmStatusRequest = StatusRequest.noData;
            Get.snackbar('Error', value?.data['message'] ?? 'Payment failed');
          }
          update();
        })
        .catchError((error) {
          print(error.toString());
          confirmStatusRequest = StatusRequest.serverfailure;
          Get.snackbar('Error', 'Payment failed. Please try again.');
          update();
        });
  }
}
