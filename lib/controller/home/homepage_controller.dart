import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:massaclinic/core/class/diohelper.dart';
import 'package:massaclinic/core/class/statusrequest.dart';
import 'package:massaclinic/core/constant/routes.dart';
import 'package:massaclinic/core/services/services.dart';
import 'package:massaclinic/data/model/mostpuplarservices_model.dart';

abstract class HomeController extends GetxController {
  getmostpup();
}

class HomeControllerImp extends HomeController {
  MyServices myServices = Get.find();
  MostPuplarServicesModel? mostPuplarServicesModel;
  StatusRequest? servicepupstate;
  bool isExpanded = false;
  List data = [];
  List categories = [];
  List items = [];
  TextEditingController? mysearch;
  bool isSearch = false;
  checkSearch(val) {
    if (val == '') {
      isSearch = false;
    }
    update();
  }

  onSearchItems() {
    isSearch = true;
    // searchItem();
    update();
  }

  changeSearch() {
    isExpanded = !isExpanded;
    update();
  }

  goToFav() {
    Get.toNamed(AppRoute.favorite);
  }
  // /api/popular-services

  // String imageUrl = myServices.sharedPreferences.getString('imageurl')!;

  List<String> nav = [
    AppRoute.complaints,
    AppRoute.archive,

    AppRoute.servicespage,
    AppRoute.reservations,
    AppRoute.homepage,
    AppRoute.homepage,
  ];

  @override
  getmostpup() {
    servicepupstate = StatusRequest.loading;
    update();

    DioHelper.getDataa(url: '/api/popular-services')
        .then((value) {
          print('naya   ${value!.data}');
          if (value.statusCode == 200) {
            mostPuplarServicesModel = MostPuplarServicesModel.fromJson(
              value.data,
            );
            servicepupstate = StatusRequest.success;

            // if (mostPuplarServicesModel!.popularServices!.isEmpty ||
            //     mostPuplarServicesModel!.popularServices!.isEmpty) {
            //   servicepupstate = StatusRequest.noData;
            update();
            // }
          }
        })
        .catchError((error) {
          print(error.toString());
          servicepupstate = StatusRequest.serverfailure;
          update();
        });
  }

  @override
  void onInit() {
    mysearch = TextEditingController();
    getmostpup();
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
