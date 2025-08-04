import 'package:get/get.dart';
import 'package:massaclinic/core/class/diohelper.dart';
import 'package:massaclinic/core/class/statusrequest.dart';
import 'package:massaclinic/core/constant/routes.dart';
import 'package:massaclinic/data/model/profile_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class ProfileController extends GetxController {}

class ProfileControllerImp extends ProfileController {
  StatusRequest? statusRequestprofile;
  ProfileModel? profileModel;
  @override
  void onInit() {
    profileUser();
    super.onInit();
  }
// logout from application
void logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
 await prefs.clear();
   
    Get.offAllNamed(AppRoute.login); 
  }

// show profile
  profileUser() {
    statusRequestprofile = StatusRequest.loading;
    update();

    DioHelper.getDataa(url: '/api/show-profile')
        .then((value) {
          print(value!.data);
          if (value.statusCode == 200) {
            profileModel = ProfileModel.fromJson(value.data);

            statusRequestprofile = StatusRequest.success;
          } else {
            statusRequestprofile = StatusRequest.noData;
          }
          update();
        })
        .catchError((error) {
          print(error.toString());
          statusRequestprofile = StatusRequest.serverfailure;
          update();
        });
  }
}
