import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:massaclinic/controller/complaint_controller.dart';
import 'package:massaclinic/core/constant/AppColor.dart';
import 'package:massaclinic/view/widget/reservation/customappar.dart';

class AddComplaintPage extends StatelessWidget {
  const AddComplaintPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ComlaintControllerImp>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: AppColor.backgroundColor,

          bottomNavigationBar: Container(
            margin: const EdgeInsets.all(12),
            height: 45,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColor.primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {
                controller.addComplaints();
              },
              child: Text(
                'Submit Complaint',
                style: TextStyle(fontSize: 16, color: AppColor.thirdColor),
              ),
            ),
          ),

          body: Column(
            // padding: EdgeInsets.zero,
            children: [
              SizedBox(height: 20),
              CustomApparReservation(
                icon: Icons.arrow_back_ios_new_outlined,
                title: 'Add Complaints',
              ),
              Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Complaint Details",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        color: AppColor.primaryColor,
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      controller: controller.descriptionController,
                      maxLines: 5,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black87,
                      ),
                      decoration: InputDecoration(
                        hintText: "Describe your complaint...",
                        hintStyle: TextStyle(
                          color: Colors.grey.shade500,
                          fontSize: 14,
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 14,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide(
                            color: AppColor.primaryColor,
                            width: 1.5,
                          ),
                        ),
                        isDense: true,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
