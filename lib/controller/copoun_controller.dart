import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:massaclinic/core/class/diohelper.dart';
import 'package:massaclinic/core/class/statusrequest.dart';
import 'package:massaclinic/data/model/coupon_model.dart';

abstract class CopounController extends GetxController {
  getCopouns();
}

class CopounControllerImp extends CopounController {
  StatusRequest? statusRequest;
  CouponModel? couponModel;

  @override
  void onInit() {
    super.onInit();
    getCopouns();
  }

  @override
  void onClose() {
    super.onClose();
  }
final List<List<Color>> gradientColors = [
  [const Color(0xFF8FC6FF), const Color(0xFF5EA6F5)], 
  [const Color(0xFF99E1C7), const Color(0xFF66C2A2)], 
  [const Color(0xFFFFC1D1), const Color(0xFFE48BA0)], 
  [const Color(0xFFFFE29F), const Color(0xFFFFB74D)], 
];
  @override
  getCopouns() {
    statusRequest = StatusRequest.loading;
    update();

    DioHelper.getDataa(url: '/api/discounts')
        .then((value) {
          print(value!.data);
          if (value.statusCode == 200) {
            statusRequest = StatusRequest.success;
            couponModel = CouponModel.fromJson(value.data);
            if (couponModel!.data!.isEmpty || couponModel!.data == null) {
              statusRequest = StatusRequest.noData;
            }
            update();
          } else {
            statusRequest = StatusRequest.noData;
          }
          update();
        })
        .catchError((error) {
          print(error.toString());
          statusRequest = StatusRequest.serverfailure;
          update();
        });
  }
}
