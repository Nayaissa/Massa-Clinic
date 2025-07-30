import 'package:get/get.dart';
import 'package:massaclinic/core/class/diohelper.dart';
import 'package:massaclinic/core/class/statusrequest.dart';
import 'package:massaclinic/data/model/doctor_model.dart';
import 'package:massaclinic/data/model/specialists_model.dart';

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

  @override
  void onInit() {
    // getSpeclistsByServices();
    // getDoctorByServices();
    super.onInit();
  }

  void setServiceDetails(String n, String i, String d, String p, String idser) {
    name = n;
    image = i;
    desc = d;
    price = p;
    id = idser;
    print('$id=================naya');
    getSpeclistsByServices();
    getDoctorByServices();
    update();
  }

  getDoctorByServices() {
    doctorStatusRequest = StatusRequest.loading;
    update();

    DioHelper.getDataa(url: '/api/services/$id/doctors')
        .then((value) {
          print(value!.data);
          if (value.statusCode == 200) {
            doctorStatusRequest = StatusRequest.success;

            doctorModel = DoctorModel.fromJson(value.data);
            print('2d');

            if (doctorModel!.data == null) {
              doctorStatusRequest = StatusRequest.noData;
            }
            update();
          } else {
            doctorStatusRequest = StatusRequest.noData;
          }
          update();
        })
        .catchError((error) {
          print(error.toString());
          doctorStatusRequest = StatusRequest.serverfailure;
          update();
        });
  }

  getSpeclistsByServices() {
    speclistsStatusRequest = StatusRequest.loading;
    update();

    DioHelper.getDataa(url: '/api/services/$id/specialists')
        .then((value) {
          print(value!.data);
          if (value.statusCode == 200) {
            speclistsStatusRequest = StatusRequest.success;

            specialistsModel = SpecialistsModel.fromJson(value.data);
            print('sp');

            if (specialistsModel!.data == null) {
              speclistsStatusRequest = StatusRequest.noData;
            }
            update();
          } else {
            speclistsStatusRequest = StatusRequest.noData;
          }
          update();
        })
        .catchError((error) {
          print(error.toString());
          doctorStatusRequest = StatusRequest.serverfailure;
          update();
        });
  }
}
