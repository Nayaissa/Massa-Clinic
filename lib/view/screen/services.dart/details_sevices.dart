import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:massaclinic/controller/services/details_services_controller.dart';
import 'package:massaclinic/controller/myreservation_controller.dart';
import 'package:massaclinic/core/constant/AppColor.dart';
import 'package:massaclinic/view/widget/services/custom_doctor_card.dart';
import 'package:massaclinic/view/widget/services/custom_text_deatils_service.dart';

class DetailsServices extends StatelessWidget {
  const DetailsServices({super.key});

  @override
  Widget build(BuildContext context) {
    DetailsServicreControllerImp servicreControllerImp = Get.put(
      DetailsServicreControllerImp(),
    );
    Get.put(BookingsController());
    return Scaffold(
      bottomNavigationBar: GetBuilder<BookingsController>(
        builder: (controller) {
          return Container(
            height: 70,
            color: AppColor.backgroundColor,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 15),
              width: double.infinity,
              height: 40,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColor.primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  controller.addReservation(
                    servicreControllerImp.id.toString(),
                  );
                },
                child: Text(
                  'Book Appointment',
                  style: TextStyle(fontSize: 16, color: AppColor.thirdColor),
                ),
              ),
            ),
          );
        },
      ),
      backgroundColor: AppColor.thirdColor,
      body: SingleChildScrollView(
        child: GetBuilder<DetailsServicreControllerImp>(
          builder: (controller) {
            return Column(
              children: [
                const SizedBox(height: 40),

                Image.asset('assets/images/filleran.png', height: 150),

                SizedBox(height: 10),
                Text(
                  controller.name!,
                  style: TextStyle(
                    fontSize: 28,
                    color: AppColor.primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 5),

                Container(
                  decoration: BoxDecoration(
                    color: AppColor.backgroundColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(35),
                      topRight: Radius.circular(35),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 10,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextDeatilsService(text: 'Details'),

                        Text(controller.desc!, style: TextStyle(fontSize: 14)),

                        const SizedBox(height: 12),

                        Row(
                          children: const [
                            Icon(Icons.access_time, color: Colors.pink),
                            SizedBox(width: 8),
                            Text(
                              'Time:  Available from 12:00 to 4:00',
                              style: TextStyle(
                                fontSize: 14,
                                color: AppColor.gery800,
                              ),
                            ),
                          ],
                        ),
 const SizedBox(height: 10),

                        Row(
                          children: [
                            Text(
                              'Session Number : ',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: AppColor.gery800,
                              ),
                            ),
                          
                            Text(
                              '4',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: AppColor.primaryColor,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),

                        Row(
                          children: [
                            Text(
                              'Price :',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: AppColor.gery800,
                              ),
                            ),
                            Spacer(),
                            Text(
                              '${controller.price}SY',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.green,
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 20),
                        const CustomTextDeatilsService(text: 'Doctors'),

                        Container(
                          height: 150,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            // physics: NeverScrollableScrollPhysics(),
                            itemCount:
                                controller.doctorModel?.data?.doctors?.length ??
                                0,
                            itemBuilder: (context, index) {
                              final doctordet =
                                  controller.doctorModel?.data?.doctors?[index];
                              return CustomDoctorCard(
                                name: doctordet?.name ?? 'naya',
                                imagePath:
                                    doctordet?.image ??
                                    'https://i.pravatar.cc/150?img=5',
                              );
                            },
                          ),
                        ),
                        CustomTextDeatilsService(text: 'Specialists'),

                        Container(
                          height: 150,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount:
                                controller
                                    .specialistsModel
                                    ?.data
                                    ?.specialists
                                    ?.length ??
                                0,
                            itemBuilder: (context, index) {
                              final specialistde =
                                  controller
                                      .specialistsModel
                                      ?.data
                                      ?.specialists?[index];
                              return CustomDoctorCard(
                                name: specialistde?.nameSpecialist ?? 'naya',
                                imagePath:
                                    specialistde?.image ??
                                    'https://i.pravatar.cc/150?img=5',
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
