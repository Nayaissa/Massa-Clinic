import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:massaclinic/controller/services/details_services_controller.dart';
import 'package:massaclinic/core/constant/AppColor.dart';

class CustomDoctorCard extends GetView<DetailsServicreControllerImp> {
  const CustomDoctorCard({super.key, required this.name, required this.imagePath});
  final String name;
  final String imagePath;
 
  @override
  Widget build(BuildContext context) {
    return Container(
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