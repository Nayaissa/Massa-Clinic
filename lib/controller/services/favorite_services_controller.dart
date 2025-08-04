import 'package:get/get.dart';
import 'package:massaclinic/core/class/diohelper.dart';
import 'package:massaclinic/core/class/statusrequest.dart';
import 'package:massaclinic/core/constant/AppColor.dart';
import 'package:massaclinic/data/model/add_favorite_model.dart';
import 'package:massaclinic/data/model/favorite_model.dart';

abstract class FavoriteServicesController extends GetxController {}

class FavoriteServicesControllerImp extends FavoriteServicesController {
  StatusRequest? favStatusRequest;
  StatusRequest? favaddStatusRequest;

  AddFavoriteModel? addFavoriteModel;
  FavoriteModel? favoriteModel;
  @override
  @override
  void onInit() {
    showFavorite();
    super.onInit();
  }

  void addToFavorite(String id, int index) {
    favaddStatusRequest = StatusRequest.loading;

    update();

    DioHelper.postsData(url: '/api/favoriteeSrvice/$id', data: {})
        .then((value) {
          print(value!.data);
          if (value.statusCode == 200) {
            favaddStatusRequest = StatusRequest.success;
            addFavoriteModel = AddFavoriteModel.fromJson(value.data);
            showFavorite();
            Get.rawSnackbar(
              backgroundColor: AppColor.secondaryColor,
              title: 'Warning',
              message: addFavoriteModel!.message,
            );
             update();
          } else {
            favaddStatusRequest = StatusRequest.noData;
          }
          update();
        })
        .catchError((error) {
          print(error.toString());
          favaddStatusRequest = StatusRequest.serverfailure;
          update();
        });
  }

  showFavorite() {
    favStatusRequest = StatusRequest.loading;
    update();

    DioHelper.getDataa(url: '/api/favoriteServices')
        .then((value) {
          print(value!.data);
          if (value.statusCode == 200) {
            favStatusRequest = StatusRequest.success;

            favoriteModel = FavoriteModel.fromJson(value.data);
            print('2--');


            if (favoriteModel!.data!.isEmpty ||favoriteModel!.data== null) {
              favStatusRequest = StatusRequest.noData;
            }
            update();
          } else {
            favStatusRequest = StatusRequest.noData;
          }
          update();
        })
        .catchError((error) {
          print(error.toString());
          favStatusRequest = StatusRequest.serverfailure;
          update();
        });
  }
}
