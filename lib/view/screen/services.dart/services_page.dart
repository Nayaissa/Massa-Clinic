import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:massaclinic/controller/services_controller.dart';
import 'package:massaclinic/core/class/statusrequest.dart';
import 'package:massaclinic/core/constant/AppColor.dart';
import 'package:massaclinic/core/constant/AppImagesAssets.dart';
import 'package:massaclinic/view/widget/Favorite&search/customsearch.dart';
import 'package:massaclinic/view/widget/services/customapparservices.dart';
import 'package:massaclinic/view/widget/services/customcardservice.dart';
import 'package:massaclinic/view/widget/services/listclassfication.dart';

class ServicesPage extends StatelessWidget {
  const ServicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ServicreControllerImp());
   

    return Scaffold(
      body: SafeArea(
        child: GetBuilder<ServicreControllerImp>(
          builder: (controller) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                children: [
                  CustomApparServices(
                    onChanged: (val) {
                      controller.onSearchItems(val);
                      controller.checkSearch(val);
                    },
                    search: controller.mysearch,
                    onPressedsearch: () {
                      //controller.onSearchItems();
                    },
                    title: 'search here',
                    prefixIcon: Icons.search_outlined,
                    onPressed: () {},
                  ),
                  const SizedBox(height: 5),

                  controller.classStatusRequest == StatusRequest.loading
                      ? Center(
                        child: Lottie.asset(
                          AppImageAssets.loding,
                          width: 200,
                          height: 150,
                        ),
                      )
                      : controller.classficationModel?.data != null
                      ?  !controller.isSearch ?
                      Container(
                        height: 48,
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount:
                              controller.classficationModel!.data!.length,
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          itemBuilder: (context, index) {
                            final isSelected =
                                index == controller.selectedCategoryIndex;
                            final title =
                                controller
                                    .classficationModel!
                                    .data![index]
                                    .title ??
                                '';

                            return ListClassfication(
                              onTap: () {
                                controller.selectCategory(index);
                              },
                              color:
                                  isSelected
                                      ? AppColor.thirdColor
                                      : Colors.white,
                              colortext:
                                  isSelected
                                      ? AppColor.primaryColor
                                      : AppColor.grey,
                              nameCat: title,
                            );
                          },
                        ),
                      ): SizedBox(height: 5,)
                      :  Text(''),
                 

                  !controller.isSearch
                      ? Expanded(
                        child:
                            controller.servicesStatusRequest ==
                                    StatusRequest.loading
                                ? Center(
                                  child: Lottie.asset(
                                    AppImageAssets.loding,
                                    width: 200,
                                    height: 150,
                                  ),
                                )
                                : controller.servicesStatusRequest ==
                                    StatusRequest.noData
                                ? Center(
                                  child: Lottie.asset(
                                    AppImageAssets.noData,
                                    width: 200,
                                    height: 150,
                                  ),
                                )
                                : GridView.builder(
                                  padding: const EdgeInsets.all(14),
                                  itemCount:
                                      controller.displayedServices?.length ?? 0,
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        mainAxisSpacing: 16,
                                        crossAxisSpacing: 16,
                                        childAspectRatio: 0.68,
                                      ),
                                  itemBuilder: (context, index) {
                                    return GetBuilder<ServicreControllerImp>(
                                      id: 'favorite_$index',
                                      builder: (controller) {
                                        final service =
                                            controller
                                                .displayedServices![index];
                                        return CustomCardService(
                                          services: service,
                                          onTap: () {
                                            controller.addToFavorite(
                                              service.id.toString(),
                                              index,
                                            );
                                          },
                                        );
                                      },
                                    );
                                  },
                                ),
                      )
                      : ListSearch(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class ListSearch extends GetView<ServicreControllerImp> {
  const ListSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GetBuilder<ServicreControllerImp>(
        builder: (controller) {
         
          
          
            return  controller.SearchStatusRequest == StatusRequest.noData?
            Lottie.asset(AppImageAssets.noData,width: 250)
         :  ListView.separated(
            padding: const EdgeInsets.symmetric(vertical: 4),
            itemCount: controller.searchModel?.services?.length ?? 0,
            separatorBuilder: (context, index) => const SizedBox(height: 10),
            itemBuilder: (context, index) {
              final item = controller.searchModel?.services?[index];
              // final progress =
              //     item.watchedEpisodes / item.totalEpisodes;

              return CustomSerach(
                imageUrl: item?.image ?? '' ,
                title: item?.name??'',
                subtitle: item?.price ??'',
              );
            },
          );
        },
      ),
    );
  }
}
