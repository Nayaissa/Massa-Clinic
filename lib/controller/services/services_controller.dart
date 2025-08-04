import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:massaclinic/controller/services/details_services_controller.dart';
import 'package:massaclinic/core/class/diohelper.dart';
import 'package:massaclinic/core/class/statusrequest.dart';
import 'package:massaclinic/core/constant/AppColor.dart';
import 'package:massaclinic/core/constant/routes.dart';
import 'package:massaclinic/data/model/add_favorite_model.dart';
import 'package:massaclinic/data/model/classfication_model.dart';
import 'package:massaclinic/data/model/search_model.dart';
import 'package:massaclinic/data/model/services_by_id_model.dart';
import 'package:massaclinic/data/model/services_model.dart';
import 'package:massaclinic/data/model/unified_service_model.dart';

abstract class ServicreController extends GetxController {
  void selectCategory(int index);
  goToDetailsSer(String name, String image, String desc, String price,String id);
  getClass();
  getServices();
  getServicesById(int id);
}

class ServicreControllerImp extends ServicreController {
  StatusRequest? classStatusRequest;
  StatusRequest? servicesStatusRequest;
    StatusRequest? SearchStatusRequest;

  

  // FavoriteServicesControllerImp controllerFav = Get.put(FavoriteServicesControllerImp());

  ClassficationModel? classficationModel;
  ServicesModel? servicesModel;
  ServicesModelById? servicesModelById;
  SearchModel ? searchModel;
  int selectedCategoryIndex = 0;
  TextEditingController? mysearch;
  bool isSearch = false;
  checkSearch(val) {
    if (val == '') {
      isSearch = false;
    }
    update();
  }

  onSearchItems(input) {
    isSearch = true;
    searchService(input);
    update();
  }

  StatusRequest? favStatusRequest;
  AddFavoriteModel? addFavoriteModel;
  // ServicreControllerImp controllerFav = Get.put(ServicreControllerImp());
  void addToFavorite(String id, int index) {
    favStatusRequest = StatusRequest.loading;
    update();

    DioHelper.postsData(url: '/api/favoriteeSrvice/$id', data: {})
        .then((value) {
          print(value!.data);
          if (value.statusCode == 200) {
            favStatusRequest = StatusRequest.success;
            addFavoriteModel = AddFavoriteModel.fromJson(value.data);
            if (classficationModel!.data![selectedCategoryIndex].title ==
                "All") {
              getServices();
            } else {
              int classificationId =
                  classficationModel!.data![selectedCategoryIndex].id!;
              getServicesById(classificationId);
            }

            Get.rawSnackbar(
              backgroundColor: AppColor.secondaryColor,
              title: 'Warning',
              message: addFavoriteModel!.message,
            );
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

  List<UnifiedServiceModel>? displayedServices;
  initialData() {}

  @override
  void onInit() {
    mysearch = TextEditingController();
    initialData();
    getClass();
    super.onInit();
  }

  @override
  void selectCategory(int index) {
    selectedCategoryIndex = index;

    int classificationId = classficationModel!.data![index].id!;
    if (classficationModel!.data![index].title == "All") {
      getServices();
    } else {
      getServicesById(classificationId);
    }

    update();
  }

  @override
  goToDetailsSer(String name, String image, String desc, String price,String id) {
    Get.put(DetailsServicreControllerImp());
    Get.find<DetailsServicreControllerImp>().setServiceDetails(
      name,
      image,
      desc,
      price,
      id
    );
    Get.toNamed(AppRoute.detailsservicespage);
  }

  @override
  getClass() {
    classStatusRequest = StatusRequest.loading;
    update();

    DioHelper.getDataa(url: '/api/Classifications')
        .then((value) {
          print(value!.data);
          if (value.statusCode == 200) {
            classficationModel = ClassficationModel.fromJson(value.data);
            classStatusRequest = StatusRequest.success;

            if (classficationModel!.data!.isNotEmpty) {
              final first = classficationModel!.data![0];
              if (first.title == "All") {
                getServices();
              } else {
                getServicesById(first.id!);
              }
            }
          } else {
            classStatusRequest = StatusRequest.noData;
          }
          update();
        })
        .catchError((error) {
          print(error.toString());
          classStatusRequest = StatusRequest.serverfailure;
          update();
        });
  }

  @override
  getServices() {
    servicesStatusRequest = StatusRequest.loading;
    update();

    DioHelper.getDataa(url: '/api/Services')
        .then((value) {
          print(value!.data);
          if (value.statusCode == 200) {
            servicesModel = ServicesModel.fromJson(value.data);
            displayedServices =
                servicesModel!.data!.map((service) {
                  return UnifiedServiceModel(
                    id: service.id!,
                    name: service.name ?? '',
                    image:
                        service.image!.startsWith("http")
                            ? service.image!.replaceAll('127.0.0.1', '10.0.2.2')
                            : "http://10.0.2.2:8000/storage/${service.image}",
                    price: double.tryParse(service.price.toString()) ?? 0,
                    description: service.description ?? '',
                    is_Favorite: service.is_favorite!,
                  );
                }).toList();
            servicesStatusRequest = StatusRequest.success;
          } else {
            servicesStatusRequest = StatusRequest.noData;
          }
          update();
        })
        .catchError((error) {
          print(error.toString());
          servicesStatusRequest = StatusRequest.serverfailure;
          update();
        });
  }

  @override
  getServicesById(id) {
    servicesStatusRequest = StatusRequest.loading;
    update();

    DioHelper.getDataa(url: '/api/Classification/$id/Services')
        .then((value) {
          print(value!.data);
          if (value.statusCode == 200) {
            servicesModelById = ServicesModelById.fromJson(value.data);
            displayedServices =
                servicesModelById!.services?.map((service) {
                  return UnifiedServiceModel(
                    id: service.id!,
                    name: service.name ?? '',
                    image:
                        service.image!.startsWith("http")
                            ? service.image!.replaceAll('127.0.0.1', '10.0.2.2')
                            : "http://10.0.2.2:8000/storage/${service.image}",
                    price: double.tryParse(service.price.toString()) ?? 0,
                    description: service.description ?? '',
                    is_Favorite: service.is_favorite!,
                  );
                }).toList();
            servicesStatusRequest = StatusRequest.success;
           if (displayedServices == null || displayedServices!.isEmpty){
              servicesStatusRequest = StatusRequest.noData;
            }
          } else {
            servicesStatusRequest = StatusRequest.noData;
          }
          update();
        })
        .catchError((error) {
          print(error.toString());
          servicesStatusRequest = StatusRequest.serverfailure;
          update();
        });
  }
 searchService(String input){
 SearchStatusRequest = StatusRequest.loading;
    update();

    DioHelper.getDataa(url: '/api/searchServicesOrClassification',query: {'input':input})
        .then((value) {
          print(value!.data);
          if (value.statusCode == 200) {
            SearchStatusRequest = StatusRequest.success;

            searchModel = SearchModel.fromJson(value.data);
            print('2--');


            if (searchModel!.services!.isEmpty ||searchModel!.services== null) {
              SearchStatusRequest = StatusRequest.noData;
            }
            update();
          } else {
            SearchStatusRequest = StatusRequest.noData;
          }
          update();
        })
        .catchError((error) {
          print(error.toString());
          SearchStatusRequest = StatusRequest.serverfailure;
          update();
        });
  }
 
 
}
