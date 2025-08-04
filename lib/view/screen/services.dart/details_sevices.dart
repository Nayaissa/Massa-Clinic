import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:massaclinic/controller/services/details_services_controller.dart';
import 'package:massaclinic/controller/myreservation_controller.dart';
import 'package:massaclinic/core/constant/AppColor.dart';

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
                child:  Text(
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
                        const Text(
                          'Details',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          controller.desc!,
                          style: TextStyle(fontSize: 14, color: Colors.black87),
                        ),

                        const SizedBox(height: 12),

                        Row(
                          children: const [
                            Icon(Icons.access_time, color: Colors.pink),
                            SizedBox(width: 8),
                            Text(
                              'Available from 12:00 to 4:00',
                              style: TextStyle(fontSize: 14),
                            ),
                          ],
                        ),

                        const SizedBox(height: 12),

                        Text(
                          '${controller.price}SY',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ),

                        const SizedBox(height: 20),

                        const Text(
                          'Doctors',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),

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
                              return DoctorCard(
                                name: doctordet?.name ?? 'naya',
                                imagePath:
                                    doctordet?.image ??
                                    'https://i.pravatar.cc/150?img=5',
                              );
                            },
                          ),
                        ),
                        const Text(
                          'Specialists',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),

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
                              return DoctorCard(
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

class DoctorCard extends StatelessWidget {
  final String name;
  final String imagePath;

  const DoctorCard({super.key, required this.name, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: ,
      width: 120,
      margin: EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColor.backgroundColor,

        border: Border.all(color: AppColor.thirdColor, width: 3),
      ),
      child: Column(
        children: [
          SizedBox(height: 5),
          CircleAvatar(
            radius: 37,
            backgroundColor: AppColor.grey,
            child: CircleAvatar(
              radius: 35,
              backgroundImage: NetworkImage(imagePath),
            ),
          ),
          const SizedBox(height: 6),
          Text(
            name,
            maxLines: 2,

            style: const TextStyle(
              fontSize: 13,
              height: 1,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const Text(
            'Doctor',
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
